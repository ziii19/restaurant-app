class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Map<String, List<String>> menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating']?.toDouble() ?? 0.0,
      menus: {
        'foods': List<String>.from(
            json['menus']['foods']?.map((item) => item['name']) ?? []),
        'drinks': List<String>.from(
            json['menus']['drinks']?.map((item) => item['name']) ?? []),
      },
    );
  }
}

class RestaurantList {
  final List<Restaurant> restaurants;

  RestaurantList({required this.restaurants});

  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    return RestaurantList(
      restaurants: (json['restaurants'] as List)
          .map((data) => Restaurant.fromJson(data))
          .toList(),
    );
  }
}
