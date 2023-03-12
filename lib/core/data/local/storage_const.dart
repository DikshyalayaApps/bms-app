/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description:
/// (c) Copyright by Dikshyalaya.com
///

class StorageConfigs {
  static const kAccessToken = 'ACCESS_TOKEN';
  static const kRefreshToken = 'REFRESH_TOKEN';
  static const kDefaultStore = 'DEFAULT_STORE';
  static const kIsFirstTime = 'ISFIRST_TIME';
  static const kLastRequestTimeStamp = 'last_request_timestamp';
  static const kLoginData = 'LOGIN_DATA';
  static const kRememberMe = 'REMEMBER_ME';
  static const kLoginCredential = 'LOGIN_CREDENTIAL';

  /// The max allowed age duration for the http cache
  static const Duration maxCacheAge = Duration(days: 30);

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String enableCache = 'Cache';
  static const String requiresToken = 'RequiresToken';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String accept = 'Accept';
  static const String retryCount = 'Retry-Count';
  static const String applicationJson = 'application/json';
}
