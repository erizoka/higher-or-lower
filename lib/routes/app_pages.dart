import 'package:get/get.dart';

import '../pages/game.dart';
import '../pages/home.dart';
import '../pages/splash.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.game,
      page: () => GamePage(),
    ),
  ];
}

abstract class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const game = '/game';
}