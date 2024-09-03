import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant.dart';
import '../models/restaurant_detail.dart';
import 'restaurant_exception.dart';

class RestaurantRepository {
  static const _baseUrl = 'https://restaurant-api.dicoding.dev';

  final http.Client client;

  RestaurantRepository({required this.client});

  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      final response = await client.get(Uri.parse('$_baseUrl/list'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (!data['error']) {
          List<dynamic> restaurantsJson = data['restaurants'];
          if (restaurantsJson.isEmpty) {
            throw DataNotFoundException();
          }
          return restaurantsJson
              .map((json) => Restaurant.fromJson(json))
              .toList();
        } else {
          throw RestaurantException('Failed to load restaurants');
        }
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw NoInternetException();
    } catch (e) {
      throw RestaurantException(e.toString());
    }
  }

  Future<RestaurantDetail> fetchRestaurantDetail(String id) async {
    try {
      final response = await client.get(Uri.parse('$_baseUrl/detail/$id'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (!data['error']) {
          return RestaurantDetail.fromJson(data['restaurant']);
        } else {
          throw RestaurantException('Failed to load restaurant detail');
        }
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw NoInternetException();
    } catch (e) {
      throw RestaurantException(e.toString());
    }
  }

  Future<List<Restaurant>> searchRestaurants(String query) async {
    try {
      final response = await client.get(Uri.parse('$_baseUrl/search?q=$query'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (!data['error']) {
          List<dynamic> restaurantsJson = data['restaurants'];
          if (restaurantsJson.isEmpty) {
            throw DataNotFoundException();
          }
          return restaurantsJson
              .map((json) => Restaurant.fromJson(json))
              .toList();
        } else {
          throw RestaurantException('Failed to search restaurants');
        }
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw NoInternetException();
    } catch (e) {
      throw RestaurantException(e.toString());
    }
  }
}
