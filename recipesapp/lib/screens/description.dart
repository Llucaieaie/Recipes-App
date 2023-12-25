import 'package:flutter/material.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/home.dart';

class DescriptionScreen extends StatefulWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  //final String description;

  const DescriptionScreen({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    //required this.description,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.multiply,
                    ),
                    image: NetworkImage(widget.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context); // Navigator.pop goes back to the previous screen
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.keyboard_backspace),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 80,
                      height: 50,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                widget.rating,
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 20),
                              ),
                              Icon(
                                Icons.star,
                                size: 28,
                                color: Colors.yellow,
                              ),
                              Spacer(),
                            ],
                          ),
                          Text("See reviews", style: TextStyle(fontSize: 12, color: Colors.yellow))
                        ],
                      ),
                    ),
                  )
                ]))),
        Expanded(child: Container())
      ],
    ));
  }
}
