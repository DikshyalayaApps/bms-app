import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bms_app/core/data/models/result_state.dart';

import '../../../../core/data/remote/network_exceptions.dart';
import '../../data/model/req_params/login_params.dart';
import '../../di/injection.dart';
import '../../domain/login_repository.dart';

class LoginNotifier extends StateNotifier<ResultState> {
  final LoginRepository _loginRepository;
  final Ref ref;

  LoginNotifier(this.ref, this._loginRepository) : super(const Idle());

  Future<void> login(LoginParams params) async {
    state = const Loading();
    final response = await _loginRepository.loginUser(params);
    response.when(success: (data) {
      ref.read(authProvider).authorize();
      // ref
      //     .read(profileInfoNotifier.notifier)
      //     .getProfileInfo(fromCache: false); //fetch profile on login
      state = Data(data: data);
    }, failure: (error) {
      state = Error(error: error as NetworkExceptions);
    });
  }
}


final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, ResultState>(
        (ref) => LoginNotifier(ref, ref.watch(loginRepositoryProvider)));
