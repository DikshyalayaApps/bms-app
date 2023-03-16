import 'package:bms_app/core/utils/context_extension.dart';
import 'package:bms_app/widgets/forms/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/appbar_without_drawer.dart';

class CovidSurveyPage extends HookConsumerWidget {
  const CovidSurveyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWithOutDrawer(title: Text('Covid Survey')),
      body: ListView(
        children: [
          Container(
              padding: context.paddingExtraLow,
              child: const Text('Schedule Week')),
          Container(
              color: context.grey4,
              width: double.infinity,
              margin: context.paddingLow,
              padding: context.paddingExtraLow,
              child: const Text('3/11/2023 - 3/17/2023')),
          _Items()
        ],
      ),
    );
  }
}

class _Items extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('3/11/2023: 10:00 PM - 06:00 AM'),
                      context.emptySizedHeightBoxExtraLow,
                      const Text('CRCDD - Florence Street'),
                      context.emptySizedHeightBoxExtraLow,
                      const Text('61 Florence St, Yonkers, NY 10704'),
                      context.emptySizedHeightBoxExtraLow,
                      PrimaryOutlinedButton(
                          borderColor: context.textColor,
                          onPressed: () {},
                          title: 'Submit Covid Information'),
                      context.emptySizedHeightBoxExtraLow,
                    ],
                  ),
                ),
              )),
    );
  }
}
