// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../features/auth/presentation/providers/auth_notifier.dart';
import '../local/storage_const.dart';
import 'api_endpoints.dart';

class CustomInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final FlutterSecureStorage _localStorage;
  bool isNormalRequest = false;
  AuthNotifier authNotifier;

  CustomInterceptor(
      this._dio, this._localStorage, this.authNotifier);

  /// Storage service used to store cache in local storage

  /// Helper method to create a storage key from
  /// request/response information

  @visibleForTesting
  String createStorageKey(
    String method,
    String baseUrl,
    String path, [
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  ]) {
    var storageKey = '${method.toUpperCase()}:${baseUrl + path}/';
    if (queryParameters.isNotEmpty) {
      storageKey += '?';
      queryParameters.forEach((key, dynamic value) {
        storageKey += '$key=$value&';
      });
    }
    return storageKey;
  }

  //TODO: Fixed the case when request is  authorized and has cache enabled
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    print('══🌍 🌍  Retrieving data from network 🌍 🌍══');
    if (options.headers[StorageConfigs.requiresToken] == false) {
      // print('══ ✋🏻✋🏻 Refresh Token [Auth] Not required ✋🏻✋🏻══');
      // if the request doesn't need token, then just continue to the next interceptor
      options.headers
          .remove(StorageConfigs.requiresToken); //remove the auxiliary header
      options.headers
          .remove(StorageConfigs.authorization); //remove the auxiliary header
      isNormalRequest = true;
      handler.next(options);
    } else {
      isNormalRequest = false;
      // get tokens from local storage, Shared-preference / Hive or flutter_secure_storage
      final accessToken =
      await _localStorage.read(key: StorageConfigs.kAccessToken);
      final refreshToken =
      await _localStorage.read(key: StorageConfigs.kRefreshToken);

      if (accessToken == null || refreshToken == null) {
        _performLogout(_dio);
        // create custom dio error
        final error = DioError(
            requestOptions: options,
            response: Response(
                statusMessage: 'Token Invalid or Not found',
                statusCode: 401,
                requestOptions: options));
        return handler.reject(error);
      } else {
        options.headers.addAll(
          <String, String>{
            StorageConfigs.authorization:
            '${StorageConfigs.bearer} $accessToken'
          },
        );
        handler.next(options);
      }
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {

    if (isNormalRequest == false) {
      if (err.response?.statusCode == 401) {
        if (_dio.options.headers[StorageConfigs.retryCount] == 1) {
          return handler.next(err);
        }
        var requestOptions = err.requestOptions;
        var accessToken = await _refreshToken();
        if (accessToken == null) {
          //if still access token is null means
          return handler.next(err);
        } else {
          final opts = Options(
              extra: err.requestOptions.extra, method: requestOptions.method);
          _dio.options.headers[StorageConfigs.authorization] =
          "${StorageConfigs.bearer} $accessToken";
          _dio.options.headers[StorageConfigs.accept] =
          StorageConfigs.applicationJson;
          _dio.options.headers[StorageConfigs.retryCount] =
          1; //setting retry count to 1 to prevent further concurrent calls
          final Response response = await _dio.request(requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          if (response != null) {
            return handler.resolve(response);
          } else {
            return handler.next(err);
          }
        }
      } else {
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<String?> _refreshToken() async {
    try {
      var dioRefresh =
          Dio(); // should create new dioRefresh instance because the request interceptor is being locked
      // if (kDebugMode) {
      //   dioRefresh.interceptors.add(PrettyDioLogger());
      // }
      // get refresh token from local storage
      final refreshToken =
          await _localStorage.read(key: StorageConfigs.kRefreshToken);
      // make request to server to get the new access token from server using refresh token
      final response = await dioRefresh.post(
        APIPathHelper.baseUrl + APIPathHelper.authAPIs(APIPath.refreshToken),
        data: {"refresh_token": "$refreshToken"},
        options: Options(
          headers: <String, dynamic>{
            StorageConfigs.accept: StorageConfigs.applicationJson,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccessToken = response
            .data["access_token"]; // parse data based on your JSON structure
        final newRefreshToken = response
            .data["refresh_token"]; // parse data based on your JSON structure
        await _localStorage.write(
            key: StorageConfigs.kAccessToken, value: newAccessToken);
        await _localStorage.write(
            key: StorageConfigs.kRefreshToken,
            value: newRefreshToken); // save to local storage
        // save to local storage
        return _localStorage.read(key: StorageConfigs.kAccessToken);
      } else if (response.statusCode == 401) {
        // it means your refresh token no longer valid now, it may be revoked by the backend
        _performLogout(_dio);
        return null;
      } else {
        return null;
      }
    } on DioError {
      _performLogout(_dio);
      return null;
    }
  }

  void _performLogout(Dio dio) async {
    // CustomToast.error('${ErrorType.refreshTokenHasExpired.description}');
    authNotifier.logout();
  }
}
