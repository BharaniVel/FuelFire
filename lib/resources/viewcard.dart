import 'package:flutter/material.dart';

class Viewcard extends StatelessWidget {
  final String text;
  final double sales;
  final double litres;
  const Viewcard({
    super.key,
    required this.text,
    required this.sales,
    required this.litres,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 242, 247, 255),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height *
              0.025, // Adjust this value to position the text as desired
          left: MediaQuery.of(context).size.width *
              0.05, // Adjust this value to position the text as desired
          child: Text(
            text,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                letterSpacing: 0.8),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height *
              0.07, // Adjust this value to position the text as desired
          left: MediaQuery.of(context).size.width *
              0.035, // Adjust this value to position the text as desired
          child: Text(
            " Sales: ₹ $sales",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height *
              0.11, // Adjust this value to position the text as desired
          left: MediaQuery.of(context).size.width *
              0.035, // Adjust this value to position the text as desired // Adjust this value to position the text as desired
          child: Text(
            " Litres : $litres L",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
