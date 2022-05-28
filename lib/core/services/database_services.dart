import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';

class DatabaseServices {
  
  List<Plant> recentViewPlants = [];
  List<Plant> cartList = [];

  // getPlants()
  Future<List<Plant>> getPlants() async {
    List<Plant> plants = [];
    final snapshot = db.collection('plants').get();
    forEach(final plantJson in snapshot.data){
    plants.add(Plant.fromJson(plantJson));
    }
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
        price: 13.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 4',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (4).png',
        price: 19.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 5',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (5).png',
        price: 17.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 6',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (6).png',
        price: 11.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 7',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (7).png',
        price: 61.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 8',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (8).png',
        price: 32.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 9',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (9).png',
        price: 12.5,
        slogans: "ths clean and green",
        description:
            'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
      ),
    );
    plants.add(
      Plant(
        name: 'Plant 10',
        type: 'Indoor',
        height: 5.2,
        humidity: 50.0,
        imageUrl: 'assets/images/plant (10).png',
        price: 22.5,
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
