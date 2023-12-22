import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/screens/favourites.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //To recreate scroll when emulating on web
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      title: "Food Recipe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.white,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: FavouritesScreen(),
    );
  }
}
