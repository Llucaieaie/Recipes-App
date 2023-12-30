import 'package:flutter/material.dart';
import 'package:recipesapp/screens/description.dart';

class RecipeCardReduced extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String globalId;
  final String description;

  RecipeCardReduced({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.globalId,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DescriptionScreen(
                      title: title,
                      rating: rating,
                      cookTime: cookTime,
                      thumbnailUrl: thumbnailUrl,
                      globalId: globalId,
                      description: description,
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Stack(
            children: [
              Align(
                child: Image(image: NetworkImage(thumbnailUrl), fit: BoxFit.cover, height: 65, width: 65,),
                alignment: Alignment(-0.9, 0),
              ),

              RecipeTitle(title: title),
              Marker(),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(flex: 2,),
                    RecipeRating(rating: rating),
                    Spacer(),
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
      child: Row(
        children: [
          Icon(
            Icons.schedule,
            color: Colors.grey,
            size: 16,
          ),
          SizedBox(width: 5),
          Text(cookTime, style: TextStyle(color: Colors.black, fontSize: 14),),
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
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18,
          ),
          SizedBox(width: 5),
          Text(rating, style: TextStyle(color: Colors.black, fontSize: 14)),
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
        alignment: Alignment(0.9, -1.15),
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
        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
      alignment: Alignment(0, -0.35),
    );
  }
}