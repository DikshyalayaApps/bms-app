/// Author:    Nabraj Khadka
/// Created:   12.03.2023
///
/// Description: Main entry file
///
/// (c) Copyright by Dikshyalaya.com
///

import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'main_common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await mainCommon();
  runApp(DevicePreview(
    enabled: kDebugMode, //kDebugMode
    builder: (context) => ProviderScope(
        overrides: const [],
        observers: [ProviderLogger()],
        child: const Application()),
  ));
}
