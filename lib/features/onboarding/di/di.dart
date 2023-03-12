import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/di/injection.dart';
import '../../../routes/di.dart';
import '../../auth/di/injection.dart';
import '../../settings/repository/app_setting_repository.dart';
import '../presentation/splash_notifier_provider.dart';

final appSettingRepository = Provider<AppSettingRepository>((ref) =>
    AppSettingRepositoryImpl(
        secureStorage: ref.watch(sharedPrefsProvider),
        authRepository: ref.watch(authRepositoryProvider)));

final splashProvider = Provider((ref) {
  return SplashProvider(
      repo: ref.watch(appSettingRepository), router: ref.watch(routerProvider));
});
