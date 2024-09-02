// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantListResult _$RestaurantListResultFromJson(
        Map<String, dynamic> json) =>
    RestaurantListResult(
      error: json['error'] as bool,
      message: json['message'] as String,
      count: (json['count'] as num).toInt(),
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantListResultToJson(
        RestaurantListResult instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      pictureId: json['pictureId'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'rating': instance.rating,
    };
