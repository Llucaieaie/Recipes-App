import 'package:flutter/material.dart';
import 'package:recipesapp/screens/description.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  //final String description;
  RecipeCard({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    //required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DescriptionScreen(title: title, rating: rating, cookTime: cookTime, thumbnailUrl: thumbnailUrl,)),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 0, 15),
          width: 350,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              ),
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply,
              ),
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              RecipeTitle(title: title),
              Marker(),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeRating(rating: rating),
                    RecipeTime(cookTime: cookTime)
                  ],
                ),
                alignment: Alignment.bottomLeft,
              ),
            ],
          ),
        ));
  }
}

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.cookTime,
  });

  final String cookTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule,
            color: Colors.yellow,
            size: 18,
          ),
          SizedBox(width: 7),
          Text(cookTime),
        ],
      ),
    );
  }
}

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18,
          ),
          SizedBox(width: 7),
          Text(rating),
        ],
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
          size: 35,
          color: Colors.yellow,
        ),
        alignment: Alignment(0.9, -1),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 19,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
