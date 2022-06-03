import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:w3/core/models/cart_model.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/database_services.dart';

class CartViewModel extends ChangeNotifier {
  final _databaseServices = DatabaseServices();

  List<Plant> cartPlants = [];
  int itemCount = 0;

  //
  get callData {
    getCartPlants();
    notifyListeners();
  }

  getCartPlants() async {
    cartPlants = await _databaseServices.getCartPlantList();
    itemCount = cartPlants.length;
    notifyListeners();
  }

  addPlantToCart(Plant plant) async {
    _databaseServices.addPlantToCart(plant);
    itemCount++;
    notifyListeners();
  }

  deletePlantFromCart(Plant plant) async {
    _databaseServices.deleteCartProduct(plant);
    getCartPlants();
    notifyListeners();
  }

  //
  void quantityIncrement(Plant plant) async {
    await _databaseServices.updateCartQuantityIncrement(plant);
    quantityReturn(plant);
  }

  void quantityDecrement(Plant plant) async {
    await _databaseServices.updateCartQuantityDecrement(plant);
    quantityReturn(plant);
  }

  quantityReturn(Plant plant) async {
    plant.quantity = await _databaseServices.itemQuantityReturn(plant);
    print("quantityReturn: ${plant.quantity}");
    notifyListeners();
  }

  int returnItemCount(Plant plant) {
    // if (cartPlants.contains(plant)) {
    //   return cartPlants[cartPlants.indexOf(plant)].itemCount.toInt();
    // } else {
    return 0;
    // }
  }

//
  incrementItemCount(Plant plant) {
    // if (!cartPlants.contains(plant)) {
    //   addToCart(plant);
    // } else {
    //   cartPlants[cartPlants.indexOf(plant)].itemCount++;
    //   notifyListeners();
    //  }
  }

  //
  decrementItemCount(Plant plant) {
    // if (cartPlants.contains(plant) && returnItemCount(plant) > 0) {
    //  cartPlants[cartPlants.indexOf(plant)].itemCount--;
    //  notifyListeners();
    //  }
  }

  double subtotalDollers() {
    double total = 0;
    // if (cartPlants.isNotEmpty) {
    //   for (int i = 0; i < cartPlants.length; i++) {
    //     total += cartPlants[i].price * cartPlants[i].itemCount;
    //   }
    //   return total;
    // }
    return total;
  }
}
