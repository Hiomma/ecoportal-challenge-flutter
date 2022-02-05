import 'package:coolmovies/controllers/reviews.controller.dart';
import 'package:coolmovies/repositories/reviews/reviews.repository.dart';
import 'package:get/get.dart';

class ReviewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsController>(() {
      return ReviewsController(repository: ReviewsRepository());
    });
  }
}
