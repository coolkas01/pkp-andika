import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/config.dart';
import 'password/check_password.dart';
import 'product/screen/add_product_fab.dart';
import 'product/screen/product_list.dart';
import 'logger/screen/logger_list.dart';
import 'providers.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Config.shared.appName),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.phone_android)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.key)),
            ],
          ),
          actions: [
            Consumer(
              builder: (_, ref, __) {
                ref.watch(connectionCheckerProvider).maybeWhen(orElse: () => '', data: (ping) {
                  debugPrint(ping.response.toString());
                  debugPrint(ping.summary.toString());
                  debugPrint(ping.toString());
                });
                final color = ref.watch(connectivityListenerProvider).maybeWhen(
                  orElse: () => Colors.blueGrey,
                  data: (conn) {
                    if (conn.first == ConnectivityResult.mobile) {
                      return Colors.green;
                    }
                    if (conn.first == ConnectivityResult.wifi) {
                      return Colors.green;
                    }
                    return Colors.red;
                  },
                );
                return Icon(Icons.circle, size: 20, color: color);
              }
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        body: TabBarView(
          children: [
            const ProductList(),
            const LoggerList(),
            CheckPassword(),
          ],
        ),
        floatingActionButton: AddProductFAB(),
      ),
    );
  }
}