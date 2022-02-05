import 'dart:async';

import 'package:coolmovies/models/movies/movies.model.dart';
import 'package:coolmovies/repositories/reviews/reviews.interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewDetailController extends GetxController {

  final IReviewsRepository repository;

  var movie = Rx<Movies?>(null);

  var loading = false.obs;

  ReviewDetailController({required this.repository});

  @override
  void onInit() async {
    super.onInit();

    await getMovie();
  }

  getMovie() async {
    _toggleLoading();

    var parameters = Get.arguments;

    final response = await repository.getMovie(parameters[0]);

    movie.value = Movies.fromJson(response);

    _toggleLoading();
  }

  void _toggleLoading() {
    loading.value = !loading.value;
  }
}
