abstract class IReviewsRepository {
  Future<dynamic> getAllMovies();
  Future<dynamic> getMovie(String id);
  Future<dynamic> addReview(String title, String movie, String body, String rating, String user);
  Future<dynamic> editReview(String title, String body, String rating, String id);
  Future<dynamic> addUser(String name);
}
