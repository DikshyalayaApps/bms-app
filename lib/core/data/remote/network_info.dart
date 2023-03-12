/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description:
/// (c) Copyright by Dikshyalaya.com
///*/

import 'package:internet_connection_checker/internet_connection_checker.dart';

//flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<InternetConnectionStatus> get onStatusChange;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      dataConnectionChecker.onStatusChange;
}
