import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract class for checking network connectivity.
abstract class NetworkInfo {
  /// Check if device is connected to internet
  Future<bool> get isConnected;
}

/// Implementation of NetworkInfo using connectivity_plus.
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
