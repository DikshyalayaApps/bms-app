import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/resources/size_constants.dart';
import '../core/resources/ui_assets.dart';
import '../features/auth/presentation/shared/auth_wrapper.dart';

class AppBarWithDrawer extends ConsumerWidget implements PreferredSizeWidget {
  final Widget? appLogo;
  final Widget title;
  final bool? showDrawer;

  const AppBarWithDrawer({
    this.appLogo,
    this.showDrawer = true,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      leading: showDrawer == true
          ? Padding(
              padding: const EdgeInsets.only(left: SC.lW),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      UIAssets.getSvg(
                        'burger_menu.svg',
                      ),
                      width: 20,
                    ),
                  ),
                  if (appLogo != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: appLogo!,
                    )
                ],
              ),
            )
          : null,
      centerTitle: true,
      title: title,
      actions: [
        AuthWidgetBuilder(builder: (context, auth) {
          if (auth == false) {
            return IconButton(
              icon: SvgPicture.asset(UIAssets.getSvg('bell.svg')),
              //SvgPicture.asset(UIAssets.getSvg('bell.svg'))
              onPressed: () {},
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
