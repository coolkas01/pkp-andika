import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_icmp_ping/flutter_icmp_ping.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityListenerProvider = StreamProvider((_) =>
  Connectivity().onConnectivityChanged);

final connectionCheckerProvider = StreamProvider((_) =>
  Ping('www.google.com', interval: 5, timeout: 15, ttl: 10).stream);