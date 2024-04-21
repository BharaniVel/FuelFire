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
          if (text == 'A1 Petrol') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PetrolPage(title: 'A1 Petrol')));
          } else if (text == 'B2 Petrol') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PetrolPage(title: 'B2 Petrol')));
          } else if (text == 'A2 Petrol') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PetrolPage(title: 'A2 Petrol')));
          }
        } else if (text == 'A1 Diesel' || text == 'B1 Diesel') {
          if (text == 'A1 Diesel') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const DieselPage(title: 'A1 Diesel')));
          } else if (text == 'B1 Diesel') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const DieselPage(title: 'B1 Diesel')));
          }
        } else if (text == 'A1 Power Petrol') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  const PowerPetrolPage(title: 'A1 Power Petrol')));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const OilPricePage(title: 'Oil')));
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.07,
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
