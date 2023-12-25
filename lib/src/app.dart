import 'package:flutter/material.dart';
import 'package:music_app_client/src/bases/router.dart';
import 'package:music_app_client/src/constants/router_path.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: routers[Paths.login],
      routes: configRouters,
    );
  }
}
