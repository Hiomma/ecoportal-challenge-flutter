import 'package:coolmovies/bindings/reviews.binding.dart';
import 'package:coolmovies/pages/home/home.page.dart';
import 'package:coolmovies/pages/reviews/reviews.page.dart';
import 'package:get/get.dart';

part './routes-path.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RoutesPath.Home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RoutesPath.Reviews,
      page: () => ReviewsPage(),
      binding: ReviewsBinding()
    ),
  ];
}