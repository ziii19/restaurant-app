import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/restaurant.dart';

class Service {
  Service._();

  static Future<RestaurantList> loadRestaurants() async {
    final String response =
        await rootBundle.loadString('assets/local_restaurant.json');
    final data = json.decode(response);
    return RestaurantList.fromJson(data);
  }
}
