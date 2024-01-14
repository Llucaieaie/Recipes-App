import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final String leftText;
  final String middleText;
  final Color startColor;
  final Color endColor;
  final double fontSize;

  Ingredient({
    required this.leftText,
    required this.middleText,
    required this.startColor,
    required this.endColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-0.95, 0),
                child: Text(
                  leftText,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  middleText,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 159, 15),
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 5, // Adjust the right position as needed
                top: 30, // Adjust the top position as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to add the current name and quantity to the shopping list
                    // For example, you might use a callback function passed from the parent widget.
                  },
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(144, 0, 0, 0), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}