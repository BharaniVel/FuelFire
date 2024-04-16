import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class PetrolPage extends StatefulWidget {
  const PetrolPage({super.key});

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
                  controller: testlitre, text: 'Enter the No of TestLitres'),
              const SizedBox(
                height: 15,
              ),
              CalculatePage(
                  controller: petrolprice, text: 'Enter the Petrol Price'),
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
