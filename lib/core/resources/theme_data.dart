import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  final inputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    // fillColor: Color(0XFFF0F0F0),
    filled: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: context.primaryColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: context.primaryColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: context.primaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.primaryColor,
        ),
        borderRadius: BorderRadius.circular(5)),
    alignLabelWithHint: true,
  );

  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: context.primaryColor),
    buttonColor: context.primaryColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  return ThemeData(
    primaryColor: context.primaryColor,
    secondaryHeaderColor: context.secondaryColor,
    scaffoldBackgroundColor: context.scaffoldBgColor,
    fontFamily: 'Roboto',
    dividerColor: context.grey,
    // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(
    //   systemNavigationBarColor: primaryColor, // Navigation bar
    //   statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarBrightness: Brightness.light
    //   // Status bar
    // )),
    // textButtonTheme: TextButtonThemeData(style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all(primaryColor),
    //   foregroundColor: MaterialStateProperty.all(primaryColor),
    //   overlayColor: MaterialStateProperty.all(primaryColor),
    //
    // )),
    // inputDecorationTheme: inputDecorationTheme, /// customized this
    buttonTheme: buttonTheme,
    colorScheme: ColorScheme(
      primary: context.primaryColor,
      onPrimary: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onSecondary: Colors.white,
      onError: Colors.red,
      surface: Colors.white,
      secondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.white,
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: context.primaryColor),
    appBarTheme: AppBarTheme(
        color: context.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        actionsIconTheme:
            const IconThemeData(color: Colors.black, opacity: 0.7, size: 28)),
  );
}
