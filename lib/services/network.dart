import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  Connectivity connectivity = Connectivity();
  bool hasConnection = false;

  StreamController<bool> connectionChangeController =
      StreamController.broadcast();
  Stream<bool> get connectionChange => connectionChangeController.stream;
  ConnectivityService() {
    checkInternetConnection();
  }
  checkInternetConnection() async {
    bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
  }

  isActivatingTheInternet() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
