import 'package:flutter/material.dart';
import 'package:retaurannt_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
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
        ),
        home: const SplashScreen());
  }
}
