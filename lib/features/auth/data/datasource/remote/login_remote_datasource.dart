import '../../../../../core/data/remote/api_endpoints.dart';
import '../../../../../core/data/remote/dio_client.dart';
import '../../model/req_params/login_params.dart';

abstract class LoginRemoteDataSource {
  Future<dynamic> loginUser(LoginParams params);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  late DioClient dioClient;

  LoginRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<dynamic> loginUser(LoginParams params) async {
    try {
      final response = await dioClient.post(
        APIPathHelper.authAPIs(APIPath.login),
        data: {
          "username": params.username?.trim(),
          "password": params.password?.trim(),
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
