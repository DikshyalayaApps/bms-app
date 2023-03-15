import 'package:bms_app/core/utils/context_extension.dart';
import 'package:bms_app/features/clock_in/presentation/time_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../widgets/appbar_without_drawer.dart';

class PriorClockInPage extends HookConsumerWidget {
  const PriorClockInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormBuilderState>.new);
    final state = ref.watch(timeListProvider);
    final timeList = state.asData?.value ?? [''];
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Prior Clock In')),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    defaultColumnWidth: const IntrinsicColumnWidth(),
                    border: TableBorder.all(color: context.grey4, width: 1.5),
                    children: List.generate(20, (index) {
                      return index == 0
                          ? TableRow(children: [
                              _buildHeaderText(
                                  'Schedule Period', index, context),
                              _buildHeaderText('House', index, context),
                              _buildHeaderText('Schedule Date', index, context),
                              _buildHeaderText('Schedule Time', index, context),
                              _buildHeaderText('Start Time', index, context),
                              _buildHeaderText('End Time', index, context),
                              _buildHeaderText('Meal Time', index, context),
                              _buildHeaderText(
                                  'No Meal Reason', index, context),
                              _buildHeaderText('Total Hours', index, context),
                            ])
                          : TableRow(children: [
                              _buildText('2/18/2023 - 2/24/2023', context),
                              _buildText('CRCDD-Florence Street', context),
                              _buildText('2/18/2023', context),
                              _buildText('10:00 PM-06:00 AM', context),
                              _buildText('10:00 PM', context),
                              _buildText('06:00 AM', context),
                              _buildText('', context),
                              _buildText('One-to-one', context),
                              _buildText('8.00', context),
                            ]);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildHeaderText(String ts, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        ts,
        style: TextStyle(
            fontSize: 14,
            fontWeight: index == 0 ? FontWeight.bold : null,
            color: index == 0 ? context.textColor : null),
      ),
    );
  }

  Padding _buildText(String ts, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        ts,
      ),
    );
  }
}
