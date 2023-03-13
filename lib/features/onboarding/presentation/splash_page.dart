import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/app_version_builder.dart';
import '../../../widgets/custom_system_overlays.dart';
import '../../../widgets/app_logo.dart';
import '../di/di.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animatable animatable;

  @override
  void dispose() {
    _animationController
      ..reset()
      ..dispose();
    super.dispose();
  }

  @override
  void initState() {
    animatable = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(0, 1),
    );
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animationController.forward().then((value) {
      ref.read(splashProvider).startupCheck();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DarkThemeAnnotatedRegion(
      child: Scaffold(
        bottomNavigationBar: const SizedBox(
            height: 60,
            child: Center(
                child: AppVersionBuilder(
                  // textStyle: Theme.of(context)
                  //     .textTheme
                  //     .bodyText1
                  //     ?.copyWith(color: Colors.white),
                ))),
        // backgroundColor: AppColors.primaryColor(1),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppLogo(aspectRatio: 3,),
              // SlideTransition(
              //   position: _animation as Animation<Offset>,
              //   child: const AspectRatio(
              //     aspectRatio: 3.5,
              //     child: AppLogo(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
