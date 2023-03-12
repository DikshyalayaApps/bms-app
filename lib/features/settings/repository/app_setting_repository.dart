import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/data/local/storage_const.dart';
import '../../auth/domain/auth_repository.dart';

abstract class AppSettingRepository {
  Future<bool> isFirstTime();

  Future<bool> get isAuthenticated;

  /// return type in day
  Future<int?> getScheduleDay(int forDays);

  void setFirstTime(bool value);

  void setScheduleDay();
}

class AppSettingRepositoryImpl extends AppSettingRepository {
  // final secureStorage secureStorage;
  final FlutterSecureStorage secureStorage;
  final AuthRepository authRepository;

  AppSettingRepositoryImpl(
      {required this.secureStorage, required this.authRepository});

  @override
  void setFirstTime(bool value) => secureStorage.write(
      key: StorageConfigs.kIsFirstTime, value: value.toString());

  @override
  Future<bool> isFirstTime() async {
    try {
      final isFirstTime =
          await secureStorage.read(key: StorageConfigs.kIsFirstTime);
      return isFirstTime == null;
    } catch (e) {
      return true;
    }
  }

  @override
  Future<bool> get isAuthenticated => authRepository.isAuthenticated();

  @override
  void setScheduleDay() {
    secureStorage.write(
        key: StorageConfigs.kIsFirstTime,
        value: (DateTime.now().millisecondsSinceEpoch).toString());
  }

  @override
  Future<int?> getScheduleDay(int forDays) async {
    final _lastRequestTime =
        await secureStorage.read(key: StorageConfigs.kLastRequestTimeStamp);
    if (_lastRequestTime != null) {
      var time =
          DateTime.fromMillisecondsSinceEpoch(int.parse(_lastRequestTime));
      var day = forDays -
          DateTime.now()
              .difference(time)
              .inDays; //change type here if you need in sec/hour/minutes
      if (day <= 0) {
        return day;
      } else {
        return day;
      }
    } else {
      return null;
    }
  }
}
