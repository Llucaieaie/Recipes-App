import 'package:flutter/material.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/cooking.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/screens/reviews.dart';

class DescriptionScreen extends StatefulWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String globalId;
  final String description;

  const DescriptionScreen({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.globalId,
    required this.description,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Shopping list',
            ),
          ],
        ),
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
                          height: 65,
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
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReviewScreen(
                                              reviewId: widget.globalId)));
                                },
                                child: const Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Marker(),
                    ]))),
            Expanded(
                child: Column(
                  children: [
                    RecipeTitle(title: widget.title),
                    RecipeDescription(
                      description: widget.description,
                    ),
                    Spacer(),
                    RecipeTime(time: widget.cookTime),
                    StartButton()
                  ],
                ))
          ],
        ));
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the cooking page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cooking()), // Replace CookingPage with your actual cooking page
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.black,
          padding: EdgeInsets.all(20),
        ),
        child: Text(
          'Start cooking!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Marker extends StatefulWidget {
  const Marker({Key? key}) : super(key: key);

  @override
  _MarkerState createState() => _MarkerState();
}

class _MarkerState extends State<Marker> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
      child: Align(
        child: Icon(
          isBookmarked ? Icons.bookmark_add : Icons.bookmark_add_outlined,
          size: 70,
          color: Colors.yellow,
        ),
        alignment: Alignment(1, -1.05),
      ),
    );
  }
}

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 25),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

class RecipeDescription extends StatelessWidget {
  const RecipeDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 8,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        child: Row(
          children: [
            Spacer(),
            Text(
              time,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.schedule),
            Spacer()
          ],
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
