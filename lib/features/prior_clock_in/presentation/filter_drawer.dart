import 'package:auto_route/auto_route.dart';
import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/dismiss_focus_overlay.dart';
import '../../../widgets/forms/buttons.dart';
import '../../../widgets/forms/textfields.dart';
import '../../clock_in/presentation/time_data_provider.dart';

class FilterDrawer extends HookConsumerWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormBuilderState>.new);
    final state = ref.watch(timeListProvider);
    final timeList = state.asData?.value ?? [''];
    return SafeArea(
      child: DismissFocusOverlay(
        child: Drawer(
            child: Stack(
          children: [
            FormBuilder(
              key: formKey,
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
                        decoration: BoxDecoration(color: context.grey3),
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
                        items: timeList
                            .map((t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(t),
                                ))
                            .toList(),
                        onSaved: (newValue) {},
                        onChanged: (value) {},
                      ),
                      context.emptySizedHeightBoxLow,
                      PrimaryDropDownField(
                        hintTxt: 'Select a Meal Time',
                        label: 'Meal Time',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Meal Time is required'),
                        ]),
                        items: timeList
                            .map((t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(t),
                                ))
                            .toList(),
                        onSaved: (newValue) {},
                        onChanged: (value) {},
                      ),
                      context.emptySizedHeightBoxLow,
                      PrimaryDropDownField(
                        hintTxt: 'No Meal Reason',
                        label: 'Select a No Meal Reason',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'No Meal Reason is required'),
                        ]),
                        items: ['Emergency']
                            .map((t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(t),
                                ))
                            .toList(),
                        onSaved: (newValue) {},
                        onChanged: (value) {},
                      ),
                      context.emptySizedHeightBoxLow,
                      PrimaryDropDownField(
                        hintTxt: 'Select a End Time',
                        label: 'End Time',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'End Time is required'),
                        ]),
                        items: timeList
                            .map((t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(t),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: PrimaryButton(
                    radius: 0,
                    onPressed: () {
                      context.router.pop(context);
                    },
                    title: 'DONE',
                  )),
                  Expanded(
                      child: PrimaryButton(
                    radius: 0,
                    color: Colors.grey,
                    onPressed: () {
                      context.router.pop(context);
                    },
                    title: 'RESET',
                  )),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}