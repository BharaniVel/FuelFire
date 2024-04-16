import 'package:flutter/material.dart';
import 'package:fuelfire/firebase_options.dart';
import 'package:fuelfire/login/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MaterialApp(home: MyApp()), // use MaterialApp
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelFire',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1)),
      home: const LoginScreen(),
    );
  }
}
