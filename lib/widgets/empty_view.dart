import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/resources/ui_assets.dart';

class EmptyView extends StatelessWidget {
  final String? message;
  final bool showError;
  final VoidCallback? onRetry;

  const EmptyView({super.key, this.message, this.showError = true, this.onRetry});

  @override
  Widget build(BuildContext context) {
    if (showError == false) {
      return const SizedBox.shrink();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 200,
          //   width: 200,
          //   // child: FlareActor(
          //   //   'UIAssets.emptyViewAnim',
          //   //   // animation:'Alarm',
          //   //   animation: 'idle',
          //   // ),
          //   child: FlareActor(
          //     UIAssets.emptyViewAnim,
          //     // animation:'Alarm',
          //     animation: 'idle',
          //   ),
          // ),
          SizedBox(
              height: 100,
              width: 150,
              child: Lottie.asset(UIAssets.getAnim('error.json'))),
          const SizedBox(
            height: 5,
          ),
          Center(
              child: Text(
            message ?? 'Oooops ! ..',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          )),
          if (onRetry != null)
            Container(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  onPressed: onRetry,
                  child: const Text('Try Again'),
                ))
          else
            Container(),
        ],
      );
    }
  }
}
