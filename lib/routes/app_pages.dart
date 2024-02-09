import 'package:to_let_mobile_app/models/auth/view/screen/sign_up.dart';
import 'package:to_let_mobile_app/models/auth/view/screen/sign_in.dart';
import 'package:get/get.dart';
import '../models/home/view/screen/filter_screen.dart';
import '../models/home/view/screen/main.dart';
import '../models/home/view/screen/notification.dart';
import '../models/statring/view/screen/onboarding.dart';
import '../models/home/view/screen/search_screen.dart';
import '../models/statring/view/screen/splash.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: _Paths.FILTER_SCREEN,
      page: () => const FilterScreen(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      transition: Transition.native,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      transition: Transition.size,
      page: () => const NotificationScreen(),
    ),
  ];
}
