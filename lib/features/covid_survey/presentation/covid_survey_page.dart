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
        children: const [Text('Covid Survey Under...')],
      ),
    );
  }
}

