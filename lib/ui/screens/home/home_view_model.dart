import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/database_services.dart';

class HomeViewModel extends ChangeNotifier {
  final _databaseServices = DatabaseServices();

  List<Plant> plants = [];
  List<Plant> recentViewedPlant = [];

  //

  Future getPlants() async {
    plants = await _databaseServices.getPlants();
    notifyListeners();
  }

  Future getRecentViewPlants() async {
    recentViewedPlant = await _databaseServices.getRecentViewPlants();
    notifyListeners();
  }

  get callData {
    getPlants();
    getRecentViewPlants();
  }

  addToRecentViewList(Plant plant) {
    if (!recentViewedPlant.contains(plant)) {
      _databaseServices.recentViewPlants.add(plant);
      notifyListeners();
    }
  }

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
