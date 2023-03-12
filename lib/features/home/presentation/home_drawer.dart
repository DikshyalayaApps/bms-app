import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/size_constants.dart';
import '../../../core/resources/ui_assets.dart';
import '../../../widgets/dialogs.dart';
import '../../../widgets/shimmer_effect.dart';
import '../../auth/di/injection.dart';
import '../../auth/presentation/shared/logout_dialog.dart';

class HomeDrawer extends ConsumerWidget {
  HomeDrawer({
    Key? key,
  }) : super(key: key);

  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: SmartRefresher(
          controller: refreshController,
          onRefresh: () {},
          header: const WaterDropHeader(),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _DrawerList(
                title: 'What\'s New !',
                onPressed: () {},
                iconImage: 'offer_icon.svg',
                // trailingWidget: true,
              ),
              _DrawerList(
                  title: 'Rate our App',
                  iconImage: 'rate_icon.svg',
                  onPressed: () {
                    // AppUtils.launchAppStore();
                  }),
              _DrawerList(
                  title: 'Log out',
                  iconImage: 'logout_icon.svg',
                  onPressed: () {
                    showAnimatedDialog(
                        context: context,
                        widget: LogOutDialog(() {
                          ref.read(authProvider).logout();
                        }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerHeader extends HookConsumerWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: AppColors.primaryColor(1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SBC.lW,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  // 'Pleas Login to continue',
                  'Username',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Any other ifno',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white, fontSize: 9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerHeaderShimmerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: AppColors.primaryColor(1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 65,
            width: 65,
            child: const ShimmerWidget(
              radius: 100,
            ),
          ),
          SBC.lW,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ShimmerWidget(
                height: 15,
                width: 160,
              ),
              SBC.mH,
              const ShimmerWidget(
                height: 15,
                width: 140,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DrawerList extends StatelessWidget {
  final String title;
  final String iconImage;

  final VoidCallback? onPressed;

  const _DrawerList({
    required this.title,
    required this.iconImage,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: onPressed,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      leading: SvgPicture.asset(
        UIAssets.getSvg(
          iconImage,
        ),
        color: AppColors.colorBlack(0.5),
        height: 19,
        width: 19,
      ),
      trailing: const Icon(
        Icons.arrow_right_outlined,
        size: 19.0,
      ),
    );
  }
}
