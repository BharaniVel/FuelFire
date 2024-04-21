import 'package:flutter/material.dart';
import 'package:fuelfire/gsheet/userfields.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/resources/showsnackbar.dart';
import 'package:fuelfire/resources/viewcard.dart';

class TotalViewPage extends StatefulWidget {
  const TotalViewPage({Key? key}) : super(key: key);

  @override
  State<TotalViewPage> createState() => _TotalViewPageState();
}

class _TotalViewPageState extends State<TotalViewPage> {
  @override
  Widget build(BuildContext context) {
    Future uploadData() async {
      String res = 'Success';
      showSnackBar('Uploading.....', context);
      UserFields user = UserFields();
      String res1 = await user.inputdata();
      if (res == res1) {
        showSnackBar('GSheets has been uploaded', context);
      } else {
        showSnackBar("It has not been uploaded", context);
      }
    }

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
                Positioned(
                  top: MediaQuery.of(context).size.height *
                      0.03, // Positioning for "Total Sales" text
                  left: MediaQuery.of(context).size.width *
                      0.05, // Adjust this value as needed
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
                  top: MediaQuery.of(context).size.height *
                      0.09, // Positioning for sales display text
                  left: MediaQuery.of(context).size.width *
                      0.03, // Adjust this value as needed
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
              padding: const EdgeInsets.only(left: 12),
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
                  Stack(
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text(
                                    'Are you sure want to upload to GSheet?'),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      uploadData();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 9, 121, 232),
                          ),
                          child: const Stack(
                            children: [
                              Positioned(
                                top: 45,
                                left: 45,
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
