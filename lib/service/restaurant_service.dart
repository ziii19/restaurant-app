import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retaurannt_app/models/restaurant_list_result.dart';

class ApiService {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantListResult?> getListRestaurant() async {
    var uri = Uri.parse('$baseUrl/list');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.isEmpty) {
          throw Exception('No data available'); // Data kosong
        }

        return RestaurantListResult.fromJson(data);
      } else {
        throw Exception('Failed to load data'); // Status code bukan 200
      }
    } on http.ClientException catch (_) {
      throw Exception('No internet connection'); // Tidak ada koneksi internet
    } on FormatException catch (_) {
      throw Exception('Invalid data format'); // Format data tidak valid
    } catch (e) {
      throw Exception(
          'An unexpected error occurred: $e'); // Kesalahan tak terduga
    }
  }
}
