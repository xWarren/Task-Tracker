import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/page.dart';
import 'core/routes/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          )),
      initialRoute: Routes.splash,
      getPages: Pages.routePage,
    );
  }
}
