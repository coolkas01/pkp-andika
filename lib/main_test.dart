import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/presentation/home_page.dart';
import 'config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.create(
    appName: 'Soal PKP Test',
    flavor: Flavor.testing,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        title: 'Flutter',
        home: HomePage(),
      );
}
