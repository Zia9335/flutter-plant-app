import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';

class DatabaseServices {
  List<Plant> plants = [];
  List<Plant> recentViewPlants = [];
  List<Plant> cartList = [];

  // getPlants()
  Future<List<Plant>> getPlants() async {
    plants.add(
      Plant(
        name: 'Plant 1',
        type: 'Indoor',
        height: 10.2,
        humidity: 60.0,
        imageUrl: 'assets/images/plant (1).png',
        price: 23.5,
        slogans: "ths plant",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 2',
        type: 'Outdoor',
        height: 5.2,
        humidity: 40.0,
        imageUrl: 'assets/images/plant (2).png',
        price: 27.5,
        slogans: "ths supper",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 3',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (3).png',
        price: 33.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );

    return plants;
  }

  Future<List<Plant>> getRecentViewPlants() async {
    return recentViewPlants;
  }

  Future<List<Plant>> getCartPlants() async {
    return cartList;
  }

  //
  List<Tab> tabsList = const [
    Tab(
      text: 'Recommended',
    ),
    Tab(
      text: 'Top',
    ),
    Tab(
      text: 'Indoore',
    ),
    Tab(
      text: 'Outdoor',
    ),
    Tab(
      text: 'small',
    ),
  ];
}
