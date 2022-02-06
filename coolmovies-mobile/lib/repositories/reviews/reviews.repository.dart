import 'package:coolmovies/repositories/reviews/reviews.interface.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewsRepository implements IReviewsRepository {
  @override
  Future<dynamic> getAllMovies() async {
    var client = GraphQLProvider.of(Get.context!).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
              }
            }
          }
        """), fetchPolicy: FetchPolicy.noCache
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['allMovies']['nodes'];
    }
  }

  @override
  Future<dynamic> getMovie(String id) async {
    var client = GraphQLProvider.of(Get.context!).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
          query MyQuery($id: UUID!) {
            movieById(id: $id) {
              id
              imgUrl
              releaseDate
              title
              movieDirectorByMovieDirectorId {
                age
                id
                name
              }
              movieReviewsByMovieId {
                nodes {
                  body
                  id
                  rating
                  title
                  nodeId
                  movieId
                  userByUserReviewerId {
                    id
                    name
                  }
                }
              }
            }
          }
        """), variables: {'id': id}, fetchPolicy: FetchPolicy.noCache,
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['movieById'];
    }
  }

  @override
  Future<dynamic> addUser(String name) async {
    var client = GraphQLProvider.of(Get.context!).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
      mutation MyMutation ($name: String!){
        createUser(input: {user: {name: $name}}) {
              user {
                name
                id
              } 
        }
      }
        """), variables: {'name': name},
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['createUser'];
    }
  }

  @override
  Future<dynamic> addReview(String title, String movie, String body, String rating, String user) async {
    var client = GraphQLProvider.of(Get.context!).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
          mutation MyMutation($title: String!, $movie: UUID!, $body: String!, $rating: Int!, $user: UUID!) {
            createMovieReview(
              input: {movieReview: {title: $title, movieId: $movie, body: $body, rating: $rating, userReviewerId: $user}}
            ) {
              clientMutationId
            }
          }
        """), variables: {'title': title, 'movie': movie, 'body': body, 'rating': int.parse(rating), 'user': user},
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['createMovieReview'];
    }
  }

  @override
  Future<dynamic> editReview(String title, String body, String rating, String id) async {
    var client = GraphQLProvider.of(Get.context!).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
          mutation MyMutation($title: String!, $body: String!, $rating: Int!, $id: UUID!) {
            updateMovieReviewById(input: {movieReviewPatch: {body: $body, title: $title, rating: $rating}, id: $id}){
              movieReview {
                id
                body
                rating
                title
              }
            }
          }
        """), variables: {'title': title, 'body': body, 'rating': int.parse(rating), 'id': id},
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['updateMovieReviewById'];
    }
  }
}
