import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterViewBuilder extends HookConsumerWidget {
  const FilterViewBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: context.paddingLow,
            margin: EdgeInsets.only(top: context.lowValue),
            color: context.grey4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text('Filter data by')),
                // 3/11/2023 : 10:00 PM - 06:00 AM (CRCDD - Florence Street)
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
