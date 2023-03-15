import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/appbar_without_drawer.dart';

class ShiftAvailabilityPage extends HookConsumerWidget {
  const ShiftAvailabilityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Shift Availability')),
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
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 40,
            child: Card(
              color: context.randomColor,
              child: const Text('My Schedule'),
            ),
          );
        },
      ),
    );
  }
}
