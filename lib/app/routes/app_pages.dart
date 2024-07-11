import 'package:get/get.dart';
import 'package:movie_screen/app/module/home/bindings/home_binding.dart';
import 'package:movie_screen/app/module/home/views/bottomnavigation.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => BottomNavigation(),
      binding: HomeBinding(),
    ),
  ];
}