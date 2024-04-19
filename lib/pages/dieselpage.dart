import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/pages/petrolpage.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class DieselPage extends StatefulWidget {
  final String title;
  const DieselPage({
    super.key,
    required this.title,
  });

  @override
  State<DieselPage> createState() => _DieselPageState();
}

class _DieselPageState extends State<DieselPage> {
  final TextEditingController closingprice = TextEditingController();
  final TextEditingController openingprice = TextEditingController();
  final TextEditingController testlitre = TextEditingController();
  final TextEditingController dieslprice = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    dieslprice.dispose();
    closingprice.dispose();
    openingprice.dispose();
    testlitre.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: IconButton(
              onPressed: () {
                setState(() {
                  dieselPriceDisplay = 0;
                  totaldiesellitres = 0;
                });
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Homescreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    dieselPriceDisplay = 0;
                    totaldiesellitres = 0;
                  });
                  if (widget.title == 'A1 Diesel') {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const PetrolPage(title: 'A1 Petrol')));
                  }
                  if (widget.title == 'B1 Diesel') {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const PetrolPage(title: 'B2 Petrol')));
                  }
                },
                icon: const Icon(Icons.navigate_next))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(widget.title),
                const SizedBox(
                  height: 250,
                ),
                CalculatePage(
                    controller: openingprice, text: 'Enter the Opening Price'),
                const SizedBox(
                  height: 15,
                ),
                CalculatePage(
                    controller: closingprice, text: 'Enter the Closing Price'),
                const SizedBox(
                  height: 15,
                ),
                CalculatePage(
                    controller: testlitre, text: 'Enter the No of TestLitres'),
                const SizedBox(
                  height: 15,
                ),
                CalculatePage(
                    controller: dieslprice, text: 'Enter the Diesel Price'),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextButton(
                    onPressed: () {
                      double closingPrice = double.parse(closingprice.text);
                      double openingPrice = double.parse(openingprice.text);
                      double testLitres = double.parse(testlitre.text);
                      double dieselPrice = double.parse(dieslprice.text);
                      double newPrice =
                          (closingPrice - (openingPrice + testLitres)) *
                              dieselPrice;
                      newPrice = double.parse(newPrice.toStringAsFixed(3));
                      double newlitre =
                          (closingPrice - (openingPrice + testLitres));
                      newlitre = double.parse(newlitre.toStringAsFixed(2));
                      setState(() {
                        dieselPriceDisplay = newPrice;
                        totaldiesellitres = newlitre;
                        if (widget.title == 'A1 Diesel') {
                          a1dieselPrice = newPrice;
                          a1diesellitres = newlitre;
                          a1dieselclosinig = closingPrice;
                          a1dieselopening = openingPrice;
                          a1diesletest = testLitres;
                          a1dieselprice = dieselPrice;
                        } else if (widget.title == 'B1 Diesel') {
                          b1dieselPrice = newPrice;
                          b1diesellitres = newlitre;
                          b1closinig = closingPrice;
                          b1opening = openingPrice;
                          b1test = testLitres;
                          b1price = dieselPrice;
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 33, 40, 243)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    child: const Text('Calculate'),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                    "Total Sales from ${widget.title} : ₹ $dieselPriceDisplay"),
                Text(
                    "Total Litres from ${widget.title} : $totaldiesellitres Litres"),
              ],
            ),
          ),
        ));
  }
}
