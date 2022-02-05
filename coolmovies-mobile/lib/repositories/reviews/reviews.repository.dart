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
        """),
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
        """), variables: {'id': id},
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      return result.data!['movieById'];
    }
  }
}
