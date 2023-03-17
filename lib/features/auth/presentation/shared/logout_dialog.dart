import 'package:flutter/material.dart';

import '../../../../widgets/forms/buttons.dart';
import '../../../../widgets/toast.dart';

class LogOutDialog extends StatelessWidget {
  final Function logout;

  const LogOutDialog(this.logout, {Key? key}) : super(key: key);

  Future<void> _onLogOutSuccess(BuildContext context) async {
    AppToast.success('Successfully logged out');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to\nlog out?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onPressed: () {
                logout();
                _onLogOutSuccess(context);
              },
              title: 'Log Out',
              width: 150,
              radius: 25,
              height: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'Cancel',
              width: 150,
              textColor: Theme.of(context).primaryColor,
              color: Colors.white,
              radius: 25,
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
