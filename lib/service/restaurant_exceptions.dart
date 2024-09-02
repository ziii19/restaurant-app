class RestaurantException implements Exception {
  final String message;
  RestaurantException(this.message);

  @override
  String toString() => 'RestaurantException: $message';
}

class NoInternetException extends RestaurantException {
  NoInternetException() : super('No internet connection.');
}

class DataNotFoundException extends RestaurantException {
  DataNotFoundException() : super('No data found.');
}

class ServerException extends RestaurantException {
  ServerException() : super('Server error occurred.');
}
