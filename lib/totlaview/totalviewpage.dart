import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuelfire/gsheet/UserSheets.dart';
import 'package:fuelfire/gsheet/userfields.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/resources/viewcard.dart';

class TotalViewPage extends StatelessWidget {
  const TotalViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalsales = a1PetrolPrice +
        a2PetrolPrice +
        b2PetrolPrice +
        b1dieselPrice +
        a1dieselPrice +
        a1powerPetrolPrice +
        oilpricedup;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 60, 106, 37),
                  ),
                ),
                const Positioned(
                  top: 30, // Adjust this value to position the text as desired
                  left: 20, // Adjust this value to position the text as desired
                  child: Text(
                    'Total Sales',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Positioned(
                  top: 90, // Adjust this value to position the text as desired
                  left: 12, // Adjust this value to position the text as desired
                  child: Text(
                    " ₹ $totalsales",
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Viewcard(
                      text: 'A1 Diesel',
                      sales: a1dieselPrice,
                      litres: a1diesellitres),
                  const SizedBox(
                    width: 20,
                  ),
                  Viewcard(
                      text: 'A1 Petrol',
                      sales: a1PetrolPrice,
                      litres: a1petrollitres),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Viewcard(
                    text: 'B1 Diesel',
                    sales: b1dieselPrice,
                    litres: b1diesellitres,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Viewcard(
                      text: 'B2 Petrol',
                      sales: b2PetrolPrice,
                      litres: b2petrollitres),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Viewcard(
                    text: 'A1 Power Petrol',
                    sales: a1powerPetrolPrice,
                    litres: a1powerpetrollitres,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Viewcard(
                      text: 'A2 Petrol',
                      sales: a2PetrolPrice,
                      litres: a2petrollitres),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Viewcard(
                    text: 'Oil',
                    sales: oilpricedup,
                    litres: oillitres,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Stack(children: [
                    GestureDetector(
                      onTap: () async {
                        UserFields userFields = UserFields();
                        await userFields.inputdata();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 9, 121, 232),
                        ),
                      ),
                    ),
                    const Positioned(
                      top:
                          30, // Adjust this value to position the text as desired
                      left:
                          20, // Adjust this value to position the text as desired
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
