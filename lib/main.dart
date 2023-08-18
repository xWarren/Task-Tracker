import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/data/database/db_helper.dart';
import 'core/resources/colors.dart' as colors;
import 'core/routes/page.dart';
import 'core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
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
          scaffoldBackgroundColor: colors.lightColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: colors.lightColor,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: colors.lightColor,
          )),
      initialRoute: Routes.splash,
      getPages: Pages.routePage,
    );
  }
}
