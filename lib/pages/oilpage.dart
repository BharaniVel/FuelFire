import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class OilPricePage extends StatefulWidget {
  const OilPricePage({super.key});

  @override
  State<OilPricePage> createState() => _OilPricePageState();
}

class _OilPricePageState extends State<OilPricePage> {
  final TextEditingController closingprice = TextEditingController();
  final TextEditingController openingprice = TextEditingController();
  final TextEditingController oilprice = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    oilprice.dispose();
    closingprice.dispose();
    openingprice.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Homescreen()));
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            children: [
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
                  controller: oilprice, text: 'Enter the PowerPetrol Price'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: 400,
                child: TextButton(
                  onPressed: () {},
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
            ],
          ),
        ));
  }
}
