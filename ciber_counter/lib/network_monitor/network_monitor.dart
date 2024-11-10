import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class NetworkMonitor {
  StreamSubscription<ConnectivityResult>? _subscription;

  void startMonitoring() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi) {
        print("Conectado ao WiFi.");
      } else if (result == ConnectivityResult.mobile) {
        print("Conectado a dados móveis.");
      } else {
        print("Não está conectado à internet.");
      }
    });
  }

  void stopMonitoring() {
    _subscription?.cancel();
  }
}