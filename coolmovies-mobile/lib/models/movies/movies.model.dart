import 'package:coolmovies/models/directors/directors.model.dart';
import 'package:coolmovies/models/reviews/reviews.model.dart';

class Movies {
  String? id;
  String? imgUrl;
  String? title;
  String? releaseDate;
  Directors? director;
  List<Reviews>? reviews;

  Movies(
      {required this.id,
      required this.imgUrl,
      required this.title,
      this.releaseDate,
      this.director,
      this.reviews});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    title = json['title'];
    releaseDate = json['releaseDate'];
    director = json['movieDirectorByMovieDirectorId'] != null
        ? Directors.fromJson(json['movieDirectorByMovieDirectorId'])
        : null;
    reviews = json['movieReviewsByMovieId'] != null
        ? json['movieReviewsByMovieId']['nodes']
            .map((e) => Reviews.fromJson(e))
            .toList()
            .cast<Reviews>()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['releaseDate'] = this.releaseDate;

    if (this.director != null) {
      data['movieDirectorByMovieDirectorId'] = this.director!.toJson();
    }

    if (this.reviews != null) {
      data['movieReviewsByMovieId'] = this.reviews!;
    }

    return data;
  }
}
