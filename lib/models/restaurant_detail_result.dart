import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_result.g.dart';

@JsonSerializable()
class RestaurantDetailResult {
  @JsonKey(name: "error")
  final bool error;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "restaurant")
  final Restaurant restaurant;

  RestaurantDetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResult.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailResultFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDetailResultToJson(this);
}

@JsonSerializable()
class Restaurant {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "pictureId")
  final String pictureId;
  @JsonKey(name: "categories")
  final List<Category> categories;
  @JsonKey(name: "menus")
  final Menus menus;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "customerReviews")
  final List<CustomerReview> customerReviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "name")
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CustomerReview {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "review")
  final String review;
  @JsonKey(name: "date")
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReviewToJson(this);
}

@JsonSerializable()
class Menus {
  @JsonKey(name: "foods")
  final List<Category> foods;
  @JsonKey(name: "drinks")
  final List<Category> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
