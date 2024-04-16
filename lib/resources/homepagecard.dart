import 'package:flutter/material.dart';
import 'package:fuelfire/pages/dieselpage.dart';
import 'package:fuelfire/pages/oilpage.dart';
import 'package:fuelfire/pages/petrolpage.dart';
import 'package:fuelfire/pages/powerpetrolpage.dart';

class Homescreencard extends StatelessWidget {
  final String text;
  final Color color;
  const Homescreencard({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == 'A1 Petrol' || text == 'B2 Petrol' || text == 'A2 Petrol') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PetrolPage()));
        } else if (text == 'A1 Diesel' || text == 'B1 Diesel') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DieselPage()));
        } else if (text == 'A1 Power Petrol') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PowerPetrolPage()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const OilPricePage()));
        }
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}