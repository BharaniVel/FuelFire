import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homeviewpage.dart';
import 'package:fuelfire/firebase_options.dart';
import 'package:fuelfire/gsheet/UserSheets.dart';
import 'package:fuelfire/login/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';

double petrolPriceDisplay = 0;
double dieselPriceDisplay = 0;
double powerpetrolPriceDisplay = 0;
double oilPriceDisplay = 0;
double totalpetrollitres = 0;
double totaldiesellitres = 0;
double totalpowerpetrollitres = 0;
double totaloillitres = 0;
double a1PetrolPrice = 0;
double a1petrollitres = 0;
double a1opening = 0;
double a1closinig = 0;
double a1test = 0;
double a1petrolprice = 0;
double b2PetrolPrice = 0;
double b2petrollitres = 0;
double b2opening = 0;
double b2closinig = 0;
double b2test = 0;
double b2price = 0;
double a2PetrolPrice = 0;
double a2petrollitres = 0;
double a2opening = 0;
double a2dupclosing = 0;
double a2dupopening = 0;
double a2closinig = 0;
double a2test = 0;
double a2price = 0;
double a1dieselPrice = 0;
double a1diesellitres = 0;
double a1dieselopening = 0;
double a1dieselclosinig = 0;
double a1diesletest = 0;
double a1dieselprice = 0;
double b1dieselPrice = 0;
double b1diesellitres = 0;
double b1opening = 0;
double b1closinig = 0;
double b1test = 0;
double b1price = 0;
double a1powerPetrolPrice = 0;
double a1powerpetrollitres = 0;
double a1poweropening = 0;
double a1powerclosinig = 0;
double a1powertest = 0;
double a1powerprice = 0;
double oilPrice = 0;
double oillitres = 0;
double oilopening = 0;
double oilclosing = 0;
double oilprice1 = 0;
double totalsales = 0;
double oilpricedup = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await UserSheetAPI.init();
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
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20)),
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                return const Homepageview();
              } else {
                return const LoginScreen();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
