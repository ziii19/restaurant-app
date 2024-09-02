import 'package:equatable/equatable.dart';

class RestaurantDetail extends Equatable {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<String> categories;
  final List<String> foods;
  final List<String> drinks;
  final double rating;
  final List<Review> customerReviews;

  const RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.foods,
    required this.drinks,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    var categories = List<String>.from(
        json['categories'].map((category) => category['name']));
    var foods =
        List<String>.from(json['menus']['foods'].map((food) => food['name']));
    var drinks = List<String>.from(
        json['menus']['drinks'].map((drink) => drink['name']));
    var reviews = List<Review>.from(
        json['customerReviews'].map((review) => Review.fromJson(review)));

    return RestaurantDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      pictureId: json['pictureId'],
      categories: categories,
      foods: foods,
      drinks: drinks,
      rating: json['rating'].toDouble(),
      customerReviews: reviews,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        foods,
        drinks,
        rating,
        customerReviews
      ];
}

class Review extends Equatable {
  final String name;
  final String review;
  final String date;

  const Review({
    required this.name,
    required this.review,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      review: json['review'],
      date: json['date'],
    );
  }

  @override
  List<Object?> get props => [name, review, date];
}
