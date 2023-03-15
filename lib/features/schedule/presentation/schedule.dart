import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/appbar_without_drawer.dart';

class SchedulePage extends HookConsumerWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('My Schedule')),
      body: ListView(
        children: [_Items()],
      ),
    );
  }
}

class _Items extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            5,
            (index) => SizedBox(
                  child: Container(
                    color: context.grey4,
                    width: double.infinity,
                    margin: context.paddingLow,
                    padding: context.paddingExtraLow,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('3/11/2023: 10:00 PM - 06:00 AM'),
                        Text('CRCDD - Florence Street'),
                        Text('61 Florence St, Yonkers, NY 10704'),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
