

import '../../../../core/data/remote/api_result.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/data/remote/network_info.dart';
import '../../domain/login_repository.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../datasource/remote/login_remote_datasource.dart';
import '../model/req_params/login_params.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<ApiResult<String?>> loginUser(LoginParams loginParams) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.loginUser(loginParams);
        if (remoteData == null) {
          return const ApiResult.failure(
              error: NetworkExceptions.defaultError('Something wrong !!'));
        }
        await localDataSource.cacheToken(
            accessToken: remoteData['accessToken'],
            refreshToken: remoteData['refreshToken']);

        return const ApiResult.success(data: 'Successfully Logged in');
      } catch (e) {
        return NetworkExceptions.handleError(e);
      }
    } else {
      return const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
    }
  }
}
