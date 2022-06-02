import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/services/database_services.dart';
import 'package:w3/ui/screens/cart/cart-view-model.dart';
import 'package:w3/ui/screens/home/home_view_model.dart';
import 'package:w3/ui/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => CartViewModel()),
      ChangeNotifierProvider(create: (context) => DatabaseServices()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          title: 'Zia-antonx-task-week-3',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: FutureBuilder(
            future: _fbapp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("you have an error ${snapshot.error.toString()}");
                return const Text('Somthing went wrong');
              } else {
                if (snapshot.hasData) {
                  return LoginScreen();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
