import 'package:flutter/material.dart';
import 'package:fuelfire/resources/homepagecard.dart';
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
              padding: const EdgeInsets.only(
                top: 30,
                left: 10,
                bottom: 30,
              ),
              child: Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 15),
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
