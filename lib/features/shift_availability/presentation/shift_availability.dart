import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../widgets/appbar_without_drawer.dart';

class ShiftAvailabilityPage extends HookConsumerWidget {
  const ShiftAvailabilityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ['Sort by', 'By Date', 'By Distance'];
    final tabBarController =
        useTabController(initialLength: tabs.length, initialIndex: 0);
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Shift Availability')),
      body: Column(
        children: [
          TabBar(
            controller: tabBarController,
            labelColor: context.primaryColor,
            indicatorColor: context.grey,
            // indicator: BoxDecoration(color: context.grey4),
            tabs: List<Widget>.generate(tabs.length, (int index) {
              return Tab(
                child: Text(
                  tabs[index],
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              );
            }),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabBarController,
                children:
                    List<Widget>.generate(tabBarController.length, (int index) {
                  return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Container(
                            margin: context.paddingLow,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Account: Adapt'),
                                context.emptySizedHeightBoxExtraLow,
                                const Text('House: Greystone Avenue (Apt 4E)'),
                                const Text(
                                    'Schedule Period: 3/11/2023 - 3/17/2023'),
                                const Text('Shift Date: 3/13/2023'),
                                const Text('Shift Time: 03:00 PM - 11:00 PM'),
                                const Text('Shift Day: Monday'),
                                const Text(
                                    'Address: 3636 Greystone Ave, Bronx, NY 10463'),
                                CheckboxListTile(
                                    title: Text(
                                      'Available?',
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    value: false,
                                    onChanged: (val) {}),
                                if (index != 4 - 1) Divider()
                              ],
                            ),
                          ),
                        );
                      });
                })),
          )
        ],
      ),
    );
  }
}
