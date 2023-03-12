/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description:
/// (c) Copyright by Dikshyalaya.com
///

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum APIPath {
  // * Auth apis
  login,
  logOut,
  refreshToken,
}

class APIPathHelper {
  static final String baseUrl = kDebugMode == true
      ? (dotenv.env['DEV_BASE_URL'] ?? "")
      : (dotenv.env['BASE_URL'] ?? ""); // global api base url

  static String authAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.login:
        return "/auth/customer-login";
      case APIPath.logOut:
        return "/user/logout";
      case APIPath.refreshToken:
        return "/token-refresh";
      default:
        return "";
    }
  }
}
