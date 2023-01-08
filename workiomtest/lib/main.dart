import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/binding.dart';
import 'package:workiomtest/routes.dart';
import 'package:workiomtest/view/screen/auth/signup.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUp(),
      routes: routes,
      initialBinding: MyBinding(),
    );
  }
  
}
