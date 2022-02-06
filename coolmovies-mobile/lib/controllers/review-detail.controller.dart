import 'dart:async';

import 'package:coolmovies/models/movies/movies.model.dart';
import 'package:coolmovies/models/reviews/reviews.model.dart';
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

  addReview(String title, String body, String user, String rating) async {
    _toggleLoading();

    var response = await repository.addUser(user);
    await repository.addReview(title, movie.value!.id.toString(), body, rating,
        response["user"]["id"]);

    await getMovie();

    _toggleLoading();
  }

  editReview(String title, String body, String rating, String id) async {
    _toggleLoading();

    await repository.editReview(title, body, rating, id);

    await getMovie();

    _toggleLoading();
  }

  averageRating(List<Reviews> reviews) {
    var originalRating = reviews[0].rating;

    var averageRating = reviews.reduce((value, e) {
          value.rating = value.rating! + e.rating!;
          return value;
        }).rating! /
        reviews.length;

    reviews[0].rating = originalRating;

    return averageRating;
  }

  void _toggleLoading() {
    loading.value = !loading.value;
  }
}
