import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/pages/petrolpage.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class PowerPetrolPage extends StatefulWidget {
  final String title;
  const PowerPetrolPage({
    super.key,
    required this.title,
  });

  @override
  State<PowerPetrolPage> createState() => _PowerPetrolPageState();
}

class _PowerPetrolPageState extends State<PowerPetrolPage> {
  final TextEditingController closingprice = TextEditingController();
  final TextEditingController openingprice = TextEditingController();
  final TextEditingController testlitre = TextEditingController();
  final TextEditingController powerpetrolprice = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    powerpetrolprice.dispose();
    closingprice.dispose();
    openingprice.dispose();
    testlitre.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          centerTitle: false,
          title: IconButton(
              onPressed: () {
                setState(() {
                  powerpetrolPriceDisplay = 0;
                  totalpowerpetrollitres = 0;
                });
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Homescreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    powerpetrolPriceDisplay = 0;
                    totalpowerpetrollitres = 0;
                  });
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const PetrolPage(title: 'A2 Petrol')));
                },
                icon: const Icon(Icons.navigate_next))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Text(widget.title),
                  const SizedBox(
                    height: 24,
                  ),
                  CalculatePage(
                      controller: openingprice,
                      text: 'Enter the Opening Price'),
                  const SizedBox(
                    height: 15,
                  ),
                  CalculatePage(
                      controller: closingprice,
                      text: 'Enter the Closing Price'),
                  const SizedBox(
                    height: 15,
                  ),
                  CalculatePage(
                      controller: testlitre,
                      text: 'Enter the No of TestLitres'),
                  const SizedBox(
                    height: 15,
                  ),
                  CalculatePage(
                      controller: powerpetrolprice,
                      text: 'Enter the PowerPetrol Price'),
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
                        double powerpetrolPrice =
                            double.parse(powerpetrolprice.text);
                        double newPrice =
                            (closingPrice - (openingPrice + testLitres)) *
                                powerpetrolPrice;
                        newPrice = double.parse(newPrice.toStringAsFixed(3));
                        double newlitre =
                            (closingPrice - (openingPrice + testLitres));
                        newlitre = double.parse(newlitre.toStringAsFixed(2));
                        setState(() {
                          powerpetrolPriceDisplay = newPrice;
                          totalpowerpetrollitres = newlitre;
                          a1powerPetrolPrice = newPrice;
                          a1powerpetrollitres = newlitre;
                          a1powerclosinig = closingPrice;
                          a1poweropening = openingPrice;
                          a1powertest = testLitres;
                          a1powerprice = powerpetrolPrice;
                        });
                        print(a1powerclosinig);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 33, 40, 243)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      "Total Sales from ${widget.title} : ₹ $powerpetrolPriceDisplay"),
                  Text(
                      "Total Litres from ${widget.title} : $totalpowerpetrollitres Litres"),
                ],
              ),
            ),
          ),
        ));
  }
}
