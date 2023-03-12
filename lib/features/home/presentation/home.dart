import 'package:bms_app/features/home/presentation/home_drawer.dart';
import 'package:bms_app/widgets/appbar_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      drawer: HomeDrawer(),
      appBar: const AppBarWithDrawer(title: Text('Home')),
    );
  }
}
