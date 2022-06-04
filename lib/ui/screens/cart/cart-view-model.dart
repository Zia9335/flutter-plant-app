import 'package:flutter/material.dart';

import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/auth_service.dart';
import 'package:w3/core/services/database_services.dart';

import '../../../locator.dart';

class CartViewModel extends ChangeNotifier {
  final _databaseServices = DatabaseServices();
  final _authService = locator<AuthService>();

  List<Plant> cartPlants = [];
  int itemCount = 0;

  //
  get callData {
    getCartPlants();
    notifyListeners();
  }

  getCartPlants() async {
    cartPlants =
        await _databaseServices.getCartPlantList(_authService.user!.uid);
    itemCount = cartPlants.length;
    notifyListeners();
  }

  addPlantToCart(Plant plant) async {
    _databaseServices.addPlantToCart(plant, _authService.user!.uid);
    itemCount++;
    notifyListeners();
  }

  deletePlantFromCart(Plant plant) async {
    await _databaseServices.deleteCartProduct(plant, _authService.user!.uid);
    getCartPlants();
    notifyListeners();
  }

  //
  void quantityIncrement(Plant plant) async {
    await _databaseServices.updateCartQuantityIncrement(
        plant, _authService.user!.uid);
    getItemQuantity(plant);
  }

  void quantityDecrement(Plant plant) async {
    await _databaseServices.updateCartQuantityDecrement(
        plant, _authService.user!.uid);
    getItemQuantity(plant);
  }

  getItemQuantity(Plant plant) async {
    plant.quantity =
        await _databaseServices.getItemQuantity(plant, _authService.user!.uid);
    print("quantityReturn: ${plant.quantity}");
    notifyListeners();
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
