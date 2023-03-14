import 'package:bms_app/core/utils/context_extension.dart';
import 'package:bms_app/widgets/forms/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../widgets/appbar_without_drawer.dart';

class ClockInPage extends HookConsumerWidget {
  const ClockInPage({
    Key? key,
  }) : super(key: key);

  Future<List<String>> getTimeList() async {
    List<String> timeList = [];
    DateTime time = DateTime(2022, 1, 1, 0, 0); // start time at 12:00 AM
    while (time.hour < 24) {
      // loop until we reach 11:55 PM
      timeList.add(
          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.hour < 12 ? 'AM' : 'PM'}");
      time =
          time.add(const Duration(minutes: 5)); // add 5 minutes to current time
      await Future.delayed(const Duration(
          milliseconds:
              1)); // add a small delay to allow other operations to run
    }
    return timeList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = useMemoized(GlobalKey<FormBuilderState>.new);
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Clock In')),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: context.paddingLow,
                  decoration: BoxDecoration(color: context.grey2),
                  child: const Text(
                      '3/13/2023: 11:00 PM - 09:00 AM (GHO - 48th Street)'),
                ),
                context.emptySizedHeightBoxLow,
                PrimaryDropDownField(
                  hintTxt: 'Select a Start Time',
                  label: 'Start Time',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Start Time is required'),
                  ]),
                  items: ['']
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text('$t'),
                          ))
                      .toList(),
                  onSaved: (newValue) {},
                  onChanged: (value) {},
                ),
                context.emptySizedHeightBoxLow,
                PrimaryDropDownField(
                  hintTxt: 'Select a Start Time',
                  label: 'Start Time',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Start Time is required'),
                  ]),
                  items: ['']
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text('$t'),
                          ))
                      .toList(),
                  onSaved: (newValue) {},
                  onChanged: (value) {},
                ),
                context.emptySizedHeightBoxLow,
                PrimaryDropDownField(
                  hintTxt: 'Select a Start Time',
                  label: 'Start Time',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Start Time is required'),
                  ]),
                  items: ['']
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text('$t'),
                          ))
                      .toList(),
                  onSaved: (newValue) {},
                  onChanged: (value) {},
                ),
                context.emptySizedHeightBoxLow,
                PrimaryDropDownField(
                  hintTxt: 'Select a Start Time',
                  label: 'Start Time',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Start Time is required'),
                  ]),
                  items: ['']
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text('$t'),
                          ))
                      .toList(),
                  onSaved: (newValue) {},
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
