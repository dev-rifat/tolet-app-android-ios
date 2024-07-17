import 'package:to_let_mobile_app/models/auth/view/screen/sign_up.dart';
import 'package:to_let_mobile_app/models/auth/view/screen/sign_in.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/all_my_post.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/change_password.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/edit_profile.dart';
import '../models/main/favorite/view/screen/wishlist_screen.dart';
import '../models/main/main/drawer_main/drawer_screen.dart';
import '../models/main/main/main.dart';
import '../models/main/notification/notification.dart';
import '../models/main/profile/view/screen/profile.dart';
import '../models/main/properties/view/screen/properties.dart';
import '../models/main/properties/view/screen/search_screen.dart';
import '../models/main/properties/view/screen/view_details.dart';
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
      page: () => const ZoomMainDrawer(),
    ),
    GetPage(
      name: _Paths.VIEW_DETAILS,
      page: () => const ViewDetails(),
    ),  GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileScreen(),
    ), GetPage(
      name: _Paths.FAVORITE,
      page: () => const WishListScreen(),
    ),

    GetPage(
      name: _Paths.MY_POSTS,
      page: () =>  MyPosts(),
    ),
    GetPage(
      name: _Paths.CAHANGE_PASSWORD,
      page: () =>  ChangePassword(),
    ), GetPage(
      name: _Paths.EDIT_PROFILE_SCREEN,
      page: () =>  EditProfileScreen(),
    ),


    GetPage(
      name: _Paths.VIEW_ALL,
      page: () => const PropertiesScreen(),
    ), GetPage(
      name: _Paths.FAVORITE,
      page: () => const WishListScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(),
    ), GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => const NotificationScreen(),
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
  ];
}
