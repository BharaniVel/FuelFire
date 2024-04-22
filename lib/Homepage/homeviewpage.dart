import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuelfire/login/loginpage.dart';
import 'package:fuelfire/resources/homepagecard.dart';
import 'package:fuelfire/resources/showsnackbar.dart';
import 'package:intl/intl.dart';

class Homepageview extends StatelessWidget {
  const Homepageview({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                  Spacer(), // This widget pushes the Logout button to the right
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 236, 47, 47)),
                    ),
                    onPressed: () async {
                      showSnackBar('Logging Out', context);
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            ..._buildHomeScreenCards(),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildHomeScreenCards() {
  return const [
    Homescreencard(
      text: 'A1 Diesel',
      color: Color.fromARGB(255, 25, 140, 234),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'A1 Petrol',
      color: Color.fromARGB(210, 56, 200, 24),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'B1 Diesel',
      color: Color.fromARGB(255, 25, 140, 234),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'B2 Petrol',
      color: Color.fromARGB(210, 56, 200, 24),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'A1 Power Petrol',
      color: Color.fromARGB(255, 165, 29, 19),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'A2 Petrol',
      color: Color.fromARGB(210, 56, 200, 24),
    ),
    SizedBox(height: 15),
    Homescreencard(
      text: 'Oil',
      color: Color.fromRGBO(88, 88, 88, 1),
    ),
    SizedBox(height: 30),
  ];
}
