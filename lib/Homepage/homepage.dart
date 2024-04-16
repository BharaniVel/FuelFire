import 'package:flutter/material.dart';
import 'package:fuelfire/resources/homepagecard.dart';
import 'package:intl/intl.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      body: SafeArea(
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
                      letterSpacing: 2),
                ),
              ),
              const Homescreencard(
                text: 'A1 Diesel',
                color: Colors.blueAccent,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'A1 Petrol',
                color: Colors.brown,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'B1 Diesel',
                color: Colors.deepPurpleAccent,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'B2 Petrol',
                color: Colors.indigo,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'A1 Power Petrol',
                color: Colors.orange,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'A2 Petrol',
                color: Colors.lightBlue,
              ),
              const SizedBox(
                height: 15,
              ),
              const Homescreencard(
                text: 'Oil',
                color: Colors.lime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
