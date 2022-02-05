import 'dart:async';

import 'package:coolmovies/models/movies/movies.model.dart';
import 'package:coolmovies/repositories/reviews/reviews.interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsController extends GetxController {

  final IReviewsRepository repository;

  var moviesList = <Movies>[].obs;

  var loading = false.obs;

  ReviewsController({required this.repository});

  @override
  void onInit() async {
    super.onInit();

    await getAllMovies();
  }

  getAllMovies() async {
    _toggleLoading();

    final response = await repository.getAllMovies();

    moviesList.addAll(response.map((e) => Movies.fromJson(e)).toList().cast<Movies>());

    _toggleLoading();
  }

  void _toggleLoading() {
    loading.value = !loading.value;
  }
}
