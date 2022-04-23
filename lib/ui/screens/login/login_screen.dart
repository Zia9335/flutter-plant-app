import 'package:flutter/material.dart';

class LoninScreen extends StatelessWidget {
  LoninScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Image(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/green-plants-loginscreen.jpg')),
              Form(
                key: _formKey,
                child: Column(
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
