import 'package:get/get.dart';

import '../../features/dashboard/dashboard_binding.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/home/home_binding.dart';
import '../../features/home/home_page.dart';
import '../../features/home/task/task_binding.dart';
import '../../features/home/task/task_page.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_page.dart';
import 'routes.dart';

class Pages {
  static final routePage = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.task,
      page: () => const TaskPage(),
      binding: TaskBinding(),
    ),
  ];
}
