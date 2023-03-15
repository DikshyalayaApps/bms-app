import 'package:auto_route/auto_route.dart';
import 'package:bms_app/core/utils/context_extension.dart';
import 'package:bms_app/features/home/presentation/home_drawer.dart';
import 'package:bms_app/routes/router.gr.dart';
import 'package:bms_app/widgets/appbar_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  // usertype = dsp
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: const AppBarWithDrawer(title: Text('Home')),
      body: ListView(
        children: [_Items()],
      ),
    );
  }
}

class _Items extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: AlignedGridView.count(
        crossAxisCount: 2,
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              context.router.navigate(const [
                ClockInRoute(),
                ScheduleRoute(),
                ShiftAvailabilityRoute(),
                PriorClockInRoute(),
                MyAvailabilityRoute(),
                CovidSurveyRoute()
              ].elementAt(index));
            },
            child: SizedBox(
              height: 80,
              child: Card(
                color: context.primaryColor,
                child: Center(
                    child: Text(
                  [
                    'Clock in',
                    'My Schedule',
                    'Shift Availability',
                    'Prior Clock In',
                    'My Availability',
                    'Covid Survey'
                  ].elementAt(index),
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700, color: context.background),
                )),
              ),
            ),
          );
        },
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
