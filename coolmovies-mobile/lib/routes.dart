import 'package:coolmovies/pages/home/home.dart';
import 'package:get/get.dart';

part './routes-path.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RoutesPath.Home,
      page: () => HomePage(),
    ),
    // GetPage(
    //   name: RoutesPath.Credits,
    //   page: () => CreditsPage(),
    // ),
  ];
}