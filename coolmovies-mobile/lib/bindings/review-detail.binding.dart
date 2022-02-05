import 'package:coolmovies/controllers/review-detail.controller.dart';
import 'package:coolmovies/controllers/reviews.controller.dart';
import 'package:coolmovies/repositories/reviews/reviews.repository.dart';
import 'package:get/get.dart';

class ReviewDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewDetailController>(() {
      return ReviewDetailController(repository: ReviewsRepository());
    });
  }
}
