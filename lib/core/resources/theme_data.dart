import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme() {
  final inputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    // fillColor: Color(0XFFF0F0F0),
    filled: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor(1),
        ),
        borderRadius: BorderRadius.circular(5)),
    alignLabelWithHint: true,
  );

  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor(1)),
    buttonColor: AppColors.primaryColor(1),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  return ThemeData(
    primaryColor: AppColors.primaryColor(1),
    secondaryHeaderColor: AppColors.secondaryColor(1),
    disabledColor: AppColors.disabledColor(),
    scaffoldBackgroundColor: AppColors.scaffoldBgColor(1),
    fontFamily: 'Roboto',
    dividerColor: AppColors.dividerColor(),
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
      primary: AppColors.primaryColor(1),
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
    iconTheme: IconThemeData(color: AppColors.primaryColor(1)),
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor(1),
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        actionsIconTheme:
            const IconThemeData(color: Colors.black, opacity: 0.7, size: 28)),
  );
}
