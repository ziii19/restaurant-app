import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'screens/splash_screen.dart';
import 'service/restaurant_service.dart';

import 'blocs/blocs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlockObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                RestaurantBloc(RestaurantRepository(client: http.Client()))
                  ..add(FetchRestaurants())),
        BlocProvider(
            create: (context) => RestaurantDetailBloc(
                RestaurantRepository(client: http.Client()))),
      ],
      child: MaterialApp(
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const SplashScreen()),
    );
  }
}

ThemeData get theme {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.deepOrange,
      hintColor: Colors.cyan,
      scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: Color.fromRGBO(216, 67, 21, 1),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Color.fromRGBO(66, 66, 66, 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color.fromRGBO(224, 247, 250, 1),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIconColor: Colors.deepOrange,
        hintStyle: const TextStyle(color: Color.fromRGBO(117, 117, 117, 1)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrange,
      ));
}
