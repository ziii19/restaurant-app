import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/restaurant/restaurant_bloc.dart';
import '../models/restaurant.dart';
import '../blocs/restaurant_detail/restaurant_detail_bloc.dart';
import '../screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RestaurantDetailBloc, RestaurantDetailState>(
      listener: (context, state) {
        if (state is RestaurantDetailLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(restaurant: state.restaurantDetail),
            ),
          );
        } else if (state is RestaurantDetailError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else {
          return;
        }
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const _HeaderApp(),
              ),
            ),
          ],
          body: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantLoaded) {
                var data = state.restaurants
                    .where(
                      (element) => element.rating >= 4.1,
                    )
                    .toList();
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final restaurant = data[index];
                    return _BuildRestaurant(restaurant: restaurant);
                  },
                );
              } else if (state is RestaurantError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _HeaderApp extends StatelessWidget {
  const _HeaderApp();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          'Restaurant',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 32),
        ),
        Text(
          'Recommendation restaurant for you!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _BuildRestaurant extends StatelessWidget {
  const _BuildRestaurant({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<RestaurantDetailBloc>()
          .add(FetchRestaurantDetail(restaurant.id)),
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.fastfood,
                        size: 60,
                        color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.shade800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      restaurant.description,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(restaurant.city,
                              style: TextStyle(color: Colors.grey.shade700)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text('${restaurant.rating}',
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
