import 'package:coolmovies/models/users/users.model.dart';

class Reviews {
  String? body;
  String? id;
  int? rating;
  String? title;
  String? nodeId;
  String? movieId;
  Users? user;

  Reviews(
      {this.body,
        this.id,
        this.rating,
        this.title,
        this.nodeId,
        this.movieId,
        this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    id = json['id'];
    rating = json['rating'];
    title = json['title'];
    nodeId = json['nodeId'];
    movieId = json['movieId'];
    user = json['userByUserReviewerId'] != null
        ? new Users.fromJson(json['userByUserReviewerId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['title'] = this.title;
    data['nodeId'] = this.nodeId;
    data['movieId'] = this.movieId;
    if (this.user != null) {
      data['userByUserReviewerId'] = this.user!.toJson();
    }
    return data;
  }
}
