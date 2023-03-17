import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar_without_drawer.dart';
import 'clock_in_edit_dialog.dart';

class ClockInPage extends HookConsumerWidget {
  const ClockInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Clock In')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [_Items()],
        ),
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
            (index) => InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ClockInUpdateDialog();
                        });
                  },
                  child: Container(
                    color: context.grey4,
                    width: double.infinity,
                    margin: context.paddingLow,
                    padding: context.paddingExtraLow,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
