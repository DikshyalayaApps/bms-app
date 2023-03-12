/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description:
/// (c) Copyright by Dikshyalaya.com
///*/

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon() async {

  //environment file
  await dotenv.load(
      fileName: "assets/.env",
      mergeWith: Platform.environment); //dotenv.env['BASE_URL'];

// changing system ui overflow color to transparent so that we can use our own custom color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  //disable Landscape mode
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}


