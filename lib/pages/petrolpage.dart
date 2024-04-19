import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/pages/dieselpage.dart';
import 'package:fuelfire/pages/oilpage.dart';
import 'package:fuelfire/pages/powerpetrolpage.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class PetrolPage extends StatefulWidget {
  final String title;
  const PetrolPage({Key? key, required this.title});

  @override
  State<PetrolPage> createState() => _PetrolPageState();
}

class _PetrolPageState extends State<PetrolPage> {
  final TextEditingController closingprice = TextEditingController();
  final TextEditingController openingprice = TextEditingController();
  final TextEditingController testlitre = TextEditingController();
  final TextEditingController petrolprice = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    petrolprice.dispose();
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
              petrolPriceDisplay = 0;
              totalpetrollitres = 0;
            });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Homescreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  petrolPriceDisplay = 0;
                  totalpetrollitres = 0;
                });
                if (widget.title == 'A1 Petrol') {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const DieselPage(title: 'B1 Diesel')));
                }
                if (widget.title == 'B2 Petrol') {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const PowerPetrolPage(title: 'A1 Power Petrol')));
                }
                if (widget.title == 'A2 Petrol') {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const OilPricePage(title: 'Oil')));
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
              const SizedBox(height: 250),
              CalculatePage(
                controller: openingprice,
                text: 'Enter the Opening Price',
              ),
              const SizedBox(height: 15),
              CalculatePage(
                controller: closingprice,
                text: 'Enter the Closing Price',
              ),
              const SizedBox(height: 15),
              CalculatePage(
                controller: testlitre,
                text: 'Enter the No of TestLitres',
              ),
              const SizedBox(height: 15),
              CalculatePage(
                controller: petrolprice,
                text: 'Enter the Petrol Price',
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: 400,
                child: TextButton(
                  onPressed: () {
                    double closingPrice = double.parse(closingprice.text);
                    double openingPrice = double.parse(openingprice.text);
                    double testLitres = double.parse(testlitre.text);
                    double petrolPrice = double.parse(petrolprice.text);
                    double newPrice =
                        (closingPrice - (openingPrice + testLitres)) *
                            petrolPrice;
                    newPrice = double.parse(newPrice.toStringAsFixed(3));
                    double newlitre =
                        (closingPrice - (openingPrice + testLitres));
                    newlitre = double.parse(newlitre.toStringAsFixed(2));
                    setState(() {
                      petrolPriceDisplay = newPrice;
                      totalpetrollitres = newlitre;
                      if (widget.title == 'A1 Petrol') {
                        a1PetrolPrice = newPrice;
                        a1petrollitres = newlitre;
                        a1closinig = closingPrice;
                        a1opening = openingPrice;
                        a1test = testLitres;
                        a1petrolprice = petrolPrice;
                      } else if (widget.title == 'B2 Petrol') {
                        b2PetrolPrice = newPrice;
                        b2petrollitres = newlitre;
                        b2closinig = closingPrice;
                        b2opening = openingPrice;
                        b2test = testLitres;
                        b2price = petrolPrice;
                      } else if (widget.title == 'A2 Petrol') {
                        a2PetrolPrice = newPrice;
                        a2petrollitres = newlitre;
                        a2closinig = closingPrice;
                        a2opening = openingPrice;
                        a2test = testLitres;
                        a2price = petrolPrice;
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 33, 40, 243),
                    ),
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
              Text("Total Sales from ${widget.title} : ₹ $petrolPriceDisplay"),
              Text(
                  "Total Litres from ${widget.title} : $totalpetrollitres Litres"),
            ],
          ),
        ),
      ),
    );
  }
}
