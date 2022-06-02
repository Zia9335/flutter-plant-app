import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/database_services.dart';

class CartViewModel extends ChangeNotifier {
  final _databaseServices = DatabaseServices();

  List<Plant> cartPlants = [];
  int itemCount = 0;

  Future getCartPlants() async {
    cartPlants = await _databaseServices.getCartPlants();
    notifyListeners();
  }

  get callData {
    getCartPlants();
  }

  // int returnItemIdext(Plant plant) {
  //   return cartPlants.indexOf(plant);
  // }

  //
  int returnItemCount(Plant plant) {
    if (cartPlants.contains(plant)) {
      return cartPlants[cartPlants.indexOf(plant)].itemCount.toInt();
    } else {
      return 0;
    }
  }

//
  incrementItemCount(Plant plant) {
    if (!cartPlants.contains(plant)) {
      addToCart(plant);
    } else {
      cartPlants[cartPlants.indexOf(plant)].itemCount++;
      notifyListeners();
    }
  }

  //
  decrementItemCount(Plant plant) {
    if (cartPlants.contains(plant) && returnItemCount(plant) > 0) {
      cartPlants[cartPlants.indexOf(plant)].itemCount--;
      notifyListeners();
    }
  }

  addToCart(Plant plant) {
    if (!cartPlants.contains(plant)) {
      _databaseServices.cartList.add(plant);
      itemCount = cartPlants.length;
      incrementItemCount(plant);

      notifyListeners();
    } else {
      incrementItemCount(plant);
      notifyListeners();
    }
  }

  double subtotalDollers() {
    double total = 0;
    if (cartPlants.isNotEmpty) {
      for (int i = 0; i < cartPlants.length; i++) {
        total += cartPlants[i].price * cartPlants[i].itemCount;
      }
      return total;
    }
    return total;
  }
}
