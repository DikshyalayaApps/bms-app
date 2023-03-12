
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/resources/ui_assets.dart';

class AppLogo extends StatelessWidget {
  final double aspectRatio;
  const AppLogo({
    Key? key,
    this.aspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: SvgPicture.asset(
    UIAssets.getSvg('app_logo.svg'),
      ),
    );
  }
}
