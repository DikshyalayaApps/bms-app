/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description: Dio client
/// (c) Copyright by Dikshyalaya.com
///*/

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../local/storage_const.dart';
import 'pretty_dio_logger.dart';

/// custom dio client for our custom Interceptors, FormData, Request Cancellation, Timeout etc
class DioClient {
  final String baseUrl;

  late Dio _dio;

  // final List<Interceptor>? interceptors;
  final Interceptor? interceptor;

  DioClient({
    required this.baseUrl,
    required Dio dio,
    this.interceptor,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 6)
      ..options.receiveTimeout = const Duration(seconds: 6)
      ..httpClientAdapter
      ..options.followRedirects = false
      ..options.headers = {'Accept': 'application/json'};
    // ..options.validateStatus = (status) {
    //   return status! < 500;
    // }
    if (interceptor != null) {
      _dio.interceptors.clear();
      _dio.interceptors.add(interceptor!);
    }

    //TODO: Add retry interceptor if possible -> RetryInterceptor

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
    // handle certificate verification check (for http request)
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }

  /// NORMAL GET REQUEST
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = false;
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// AUTHORIZED GET REQUEST
  Future<dynamic> authGet(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = true;
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// NORMAL POST REQUEST
  Future<dynamic> post(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = false;
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// AUTHORIZED POST REQUEST
  Future<dynamic> authMultiPartPost(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = true;
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> multiPartPost(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = false;
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// AUTHORIZED POST REQUEST
  Future<dynamic> authPost(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool enableCache = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = true;
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// PATCH REQUEST
  Future<dynamic> patch(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    bool enableCache = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = true;
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE REQUEST
  Future<dynamic> delete(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    bool enableCache = false,
    CancelToken? cancelToken,
  }) async {
    try {
      _dio.options.headers[StorageConfigs.enableCache] = enableCache;
      _dio.options.headers[StorageConfigs.requiresToken] = true;
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
