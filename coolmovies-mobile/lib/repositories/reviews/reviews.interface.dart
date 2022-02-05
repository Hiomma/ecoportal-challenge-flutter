abstract class IReviewsRepository {
  Future<dynamic> getAllMovies();
  Future<dynamic> getMovie(String id);
}
