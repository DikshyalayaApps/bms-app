import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bms_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:bms_app/features/auth/data/datasource/remote/login_remote_datasource.dart';
import 'package:bms_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:bms_app/features/auth/data/repository/login_repository_impl.dart';
import 'package:bms_app/features/auth/domain/login_repository.dart';

import '../../../core/di/injection.dart';
import '../domain/auth_repository.dart';
import '../presentation/providers/auth_notifier.dart';

// * local data source
final _localAuthDataSource = Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
final _authLocalDataSource = Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
// * local data source

// * remote data source
final _loginRemoteDataSource = Provider<LoginRemoteDataSource>((ref) =>
    LoginRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// * remote data source

// *  Repo implementation
final authRepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        localDataSource: ref.watch(_localAuthDataSource),
        networkInfo: ref.watch(networkInfoProvider)));

final loginRepositoryProvider = Provider<LoginRepository>((ref) =>
    LoginRepositoryImpl(
        remoteDataSource: ref.watch(_loginRemoteDataSource),
        networkInfo: ref.watch(networkInfoProvider),
        localDataSource: ref.watch(_authLocalDataSource)));

// * Repo implementation

// * auth providers
final authProvider = Provider((ref) => AuthNotifier(ref.watch(authRepositoryProvider)));
final authProviderStateNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => ref.watch(authProvider));
