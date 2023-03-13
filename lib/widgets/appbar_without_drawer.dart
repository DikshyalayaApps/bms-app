import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarWithOutDrawer extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;

  const AppBarWithOutDrawer({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          context.router.pop();
        },
      ),
      centerTitle: true,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
