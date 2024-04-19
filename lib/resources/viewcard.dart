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
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 30, // Adjust this value to position the text as desired
          left: 20, // Adjust this value to position the text as desired
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 70, // Adjust this value to position the text as desired
          left: 14, // Adjust this value to position the text as desired
          child: Text(
            " Sales: ₹ $sales",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 110, // Adjust this value to position the text as desired
          left: 14, // Adjust this value to position the text as desired
          child: Text(
            " Litres : $litres L",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
