import 'package:flutter/material.dart';
import 'package:retaurannt_app/service/service.dart';
import '../models/restaurant.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navToHome(RestaurantList restaurantList) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomeScreen(restaurants: restaurantList.restaurants),
        ),
        (route) => false,
      );
    }

    Future.delayed(const Duration(seconds: 3)).then(
      (value) async {
        try {
          RestaurantList restaurantList = await Service.loadRestaurants();
          if (restaurantList.restaurants.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No restaurants found.')),
            );
          } else {
            navToHome(restaurantList);
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      },
    );

    // Show splash screen logo
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
