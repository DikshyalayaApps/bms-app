import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar_without_drawer.dart';
import 'filter_bottom_sheet.dart';

class PriorClockInPage extends HookConsumerWidget {
  const PriorClockInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWithOutDrawer(
        title: const Text('Prior Clock In'),
        trailingWidget: Builder(builder: (context) {
          return Padding(
            padding: context.paddingLow,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const FilterBottomSheet();
                    });
              },
              child: Icon(
                Icons.filter_alt_outlined,
                color: context.background,
              ),
            ),
          );
        }),
      ),
      body: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                padding: context.paddingLow,
                decoration: BoxDecoration(
                    color: context.grey5,
                    border: Border.all(color: context.grey3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Schedule Period: 2/18/2023 - 2/24/2023'),
                    context.emptySizedHeightBoxExtraLow,
                    const Text('Schedule Date: 2/18/2023 '),
                    context.emptySizedHeightBoxExtraLow,
                    const Text('Schedule Time: 10:00 PM-06:00 AM'),
                    context.emptySizedHeightBoxExtraLow,
                    const Text('Actual Time: 10:00 PM-06:00 AM'),
                    context.emptySizedHeightBoxExtraLow,
                    const Text('Meal Time: 30 Minutes'),
                    context.emptySizedHeightBoxExtraLow,
                    const Text('Total Hours: 7.50'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
