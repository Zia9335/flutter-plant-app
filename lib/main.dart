import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:w3/ui/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:w3/ui/screens/product_details/product_details.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider(create: (context) => ProductDeatailsScreen()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          home: LoginScreen(),
        );
      },
    );
  }
}
