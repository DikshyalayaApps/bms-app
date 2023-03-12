import 'dart:async';

import '../../../routes/router.gr.dart';
import '../../settings/repository/app_setting_repository.dart';

class SplashProvider {
  AppSettingRepository repo;
  AppRouter router;

  SplashProvider({required this.repo, required this.router}) {
    gotoLandingPage();
  }

  void startupCheck() async {
    var isFirstTime = await repo.isFirstTime();
    Timer(const Duration(seconds: 2), () async {
      // await firebaseRepo.subscribeToTopic();
      if (isFirstTime) {
        gotoIntroPage();
      } else {
        disableIntroPage();
      }
    });
  }

  void gotoIntroPage() async {
    // await router.pushAndPopUntil(
    //   const IntroRoute(),
    //   predicate: (route) => false,
    // );
  }

  void disableIntroPage() async {
    repo.setFirstTime(false);
    gotoLandingPage();
  }

  void gotoLandingPage() async {
    await router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }
}
