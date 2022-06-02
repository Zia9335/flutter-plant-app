import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/core/services/database_services.dart';

class HomeViewModel extends ChangeNotifier {
  final databaseServices = DatabaseServices();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;

  List<Plant> plants = [];
  List<Plant> recentViewedPlant = [];

  //

  Future getPlants() async {
    plants = await databaseServices.getPlantsDataList();
    notifyListeners();
  }

  Future getRecentViewPlants() async {
    recentViewedPlant = await databaseServices.getRecentViewPlants();
    notifyListeners();
  }

  get callData async {
    //  await databaseServices.sendDataToFirestore;
    getPlants();
    getRecentViewPlants();
  }

  addToRecentViewList(Plant plant) {
    if (!recentViewedPlant.contains(plant)) {
      databaseServices.recentViewPlants.add(plant);
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

  // void callSignupfunction(BuildContext context) async {
  //   try {
  //     await _auth
  //         .createUserWithEmailAndPassword(
  //             email: signUpModel.email!, password: signUpModel.password!)
  //         .then((uid) => {
  //               sendDetailsToFirestore(context),
  //             });
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

  // sendDetailsToFirestore(BuildContext context) async {
  //   User? user = _auth.currentUser;

  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(user!.uid)
  //       .set(signUpModel.toJson());
  //   Fluttertoast.showToast(msg: "Register Successful");
  //   Navigator.pushAndRemoveUntil(
  //       (context),
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //       (route) => false);
  // }
}
