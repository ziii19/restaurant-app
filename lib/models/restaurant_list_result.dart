import 'package:json_annotation/json_annotation.dart';

part 'restaurant_list_result.g.dart';

@JsonSerializable()
class RestaurantListResult {
  @JsonKey(name: "error")
  final bool error;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "restaurants")
  final List<RestaurantModel> restaurants;

  RestaurantListResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListResult.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListResultFromJson(json);
}

@JsonSerializable()
class RestaurantModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "pictureId")
  final String pictureId;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "rating")
  final double rating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
