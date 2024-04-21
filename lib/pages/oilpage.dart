import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homepage.dart';
import 'package:fuelfire/main.dart';
import 'package:fuelfire/resources/calculatepage.dart';

class OilPricePage extends StatefulWidget {
  final String title;
  const OilPricePage({
    super.key,
    required this.title,
  });

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
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
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
                  setState(() {});
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
                      controller: oilprice, text: 'Enter the Oil Price'),
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
                        double oilPrice = double.parse(oilprice.text);
                        double oldPrice =
                            (openingPrice - closingPrice) * oilPrice;
                        oldPrice = double.parse(oldPrice.toStringAsFixed(3));
                        double newlitre = openingPrice - closingPrice;
                        newlitre = double.parse(newlitre.toStringAsFixed(2));
                        setState(() {
                          oilclosing = closingPrice;
                          oilopening = openingPrice;
                          oilprice1 = oilPrice;
                          oilPriceDisplay = oldPrice;
                          totaloillitres = newlitre;
                          oilpricedup = oldPrice;
                          oillitres = newlitre;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 40, 243)),
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
                  Text("Total Sales from ${widget.title} : ₹ $oilPriceDisplay"),
                  Text(
                      "Total Litres from ${widget.title} : $totaloillitres Litres"),
                ],
              ),
            ),
          ),
        ));
  }
}
