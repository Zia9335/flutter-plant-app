import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/database_services.dart';
import 'package:provider/provider.dart';
import 'package:w3/core/models/plant_model.dart';

class DatabaseServices extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Plant> plantsDataSet = [
    Plant(
      name: 'Plant 1',
      type: 'Indoor',
      height: 10.2,
      humidity: 60.0,
      imageUrl: 'assets/images/plant (1).png',
      price: 23.5,
      itemCount: 0,
      slogans: "ths plant",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 2',
      type: 'Outdoor',
      height: 5.2,
      humidity: 40.0,
      itemCount: 0,
      imageUrl: 'assets/images/plant (2).png',
      price: 27.5,
      slogans: "ths supper",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 3',
      type: 'Indoor',
      height: 5.2,
      itemCount: 0,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (3).png',
      price: 13.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 4',
      type: 'Indoor',
      height: 5.2,
      humidity: 50.0,
      itemCount: 0,
      imageUrl: 'assets/images/plant (4).png',
      price: 19.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 5',
      type: 'Indoor',
      height: 5.2,
      humidity: 50.0,
      itemCount: 0,
      imageUrl: 'assets/images/plant (5).png',
      price: 17.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 6',
      type: 'Indoor',
      itemCount: 0,
      height: 5.2,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (6).png',
      price: 11.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 7',
      type: 'Indoor',
      height: 5.2,
      itemCount: 0,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (7).png',
      price: 61.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 8',
      type: 'Indoor',
      height: 5.2,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (8).png',
      price: 32.5,
      itemCount: 0,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 9',
      type: 'Indoor',
      itemCount: 0,
      height: 5.2,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (9).png',
      price: 12.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
    Plant(
      name: 'Plant 10',
      type: 'Indoor',
      height: 5.2,
      itemCount: 0,
      humidity: 50.0,
      imageUrl: 'assets/images/plant (10).png',
      price: 22.5,
      slogans: "ths clean and green",
      description:
          'The Flutter team recommends that beginners to Flutter development use Provider for state management.',
    ),
  ];
  List<Plant> recentViewPlants = [];
  List<Plant> cartList = [];

// create function get data from firestore
  Future<List<Plant>> getPlantsDataList() async {
    List<Plant> plants = [];
    try {
      QuerySnapshot querySnapshot =
          await firebaseFirestore.collection('plant').get();
      if (querySnapshot.docs.isEmpty) {
        debugPrint('No data found');
        return [];
      } else {
        querySnapshot.docs.forEach((documentSnapshot) {
          plants.add(Plant.fromJson(documentSnapshot.data()));
        });
        debugPrint('plants_data lenght =>${plants.length}');
      }

      return plants;
    } catch (c) {
      print(c);
      print('Error in data get');
      return [];
    }
  }

  // function to push data to firestore
  Future<void> sendDataToFirestore() async {
    try {
      if (plantsDataSet.isEmpty) {
        debugPrint('No data found to sent');
        return;
      } else {
        plantsDataSet.forEach((plant) async {
          await firebaseFirestore
              .collection('plant')
              .add(plant.toJson())
              .then((value) {
            debugPrint('data sent');
          }).catchError((e) {
            debugPrint('error in data sent loop');
          });
        });
      }
    } catch (c) {
      print(c);
      print('Error in data sent');
    }
  }

  // Future sendDataToFirestore() async {
  //   print("send data function is clicked");

  //   await FirebaseFirestore.instance
  //       .collection("plant")
  //       .add(plantsDataSet[0].toJson());
  // }

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
