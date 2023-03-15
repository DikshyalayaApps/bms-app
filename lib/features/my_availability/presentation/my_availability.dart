import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/appbar_without_drawer.dart';
import '../../../widgets/forms/buttons.dart';
import '../../../widgets/forms/textfields.dart';

class MyAvailabilityPage extends HookConsumerWidget {
  const MyAvailabilityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('My Availability')),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Flexible(
                      flex: 2,
                      child: Text(
                          'Do you want any more shifts) for 3/11/2023 - 3/17/2023 ?')),
                  Flexible(
                    child: PrimaryRadioButton(
                      validator: FormBuilderValidators.compose([]),
                      onSaved: (newValue) {},
                      options: ['Yes', 'No']
                          .map((val) => FormBuilderFieldOption(
                                value: val,
                                child: Text(val),
                              ))
                          .toList(growable: false),
                      onChanged: (value) {},
                      label: '',
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Flexible(
                      flex: 2,
                      child: Text(
                          'Are you waiting for more shifts) from Manager for 3/11/2023 - 3/17/2023 ?')),
                  Flexible(
                    child: PrimaryRadioButton(
                      validator: FormBuilderValidators.compose([]),
                      onSaved: (newValue) {},
                      options: ['Yes', 'No']
                          .map((val) => FormBuilderFieldOption(
                                value: val,
                                child: Text(val),
                              ))
                          .toList(growable: false),
                      onChanged: (value) {},
                      label: '',
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Flexible(
                      flex: 2,
                      child: Text(
                          'Did you get any shift(s) from manager for 3/11/2023 - 3/17/2023 ?')),
                  Flexible(
                    child: PrimaryRadioButton(
                      validator: FormBuilderValidators.compose([]),
                      onSaved: (newValue) {},
                      options: ['Yes', 'No']
                          .map((val) => FormBuilderFieldOption(
                                value: val,
                                child: Text(val),
                              ))
                          .toList(growable: false),
                      onChanged: (value) {},
                      label: '',
                    ),
                  ),
                ],
              ),
              context.emptySizedHeightBoxLow,
              Center(
                  child: PrimaryButton(
                    onPressed: () {},
                    title: 'SAVE',
                    // width: context.highValue,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
