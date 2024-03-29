import 'package:flutter/material.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/description.dart';
import 'package:recipesapp/screens/home.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String globalId;
  final String description;

  const RecipeCard({super.key, 
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
          margin: const EdgeInsets.fromLTRB(15, 10, 0, 15),
          width: 350,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(
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
              Marker(
                  recipe: Recipe(
                      name: title,
                      rating: double.parse(rating),
                      images: thumbnailUrl,
                      time: cookTime,
                      globalID: globalId,
                      description: description)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeRating(rating: rating),
                    RecipeTime(cookTime: cookTime)
                  ],
                ),
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.schedule,
            color: Colors.yellow,
            size: 18,
          ),
          const SizedBox(width: 7),
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18,
          ),
          const SizedBox(width: 7),
          Text(rating),
        ],
      ),
    );
  }
}

class Marker extends StatefulWidget {
  const Marker({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  _MarkerState createState() => _MarkerState();
}

class _MarkerState extends State<Marker> {
  bool isBookmarked = false;
  int saved = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBookmarked = !isBookmarked;
          if (isBookmarked) {
            for (var i = 0; i < favouriteRecipes.length; i++) {
              if (widget.recipe.globalID == favouriteRecipes[i].globalID) {
                saved++;
              }
            }
            if (saved == 0) {
              favouriteRecipes.add(widget.recipe);
            }
            saved = 0;
          }
          if (!isBookmarked) {
            for (var i = 0; i < favouriteRecipes.length; i++) {
              if (widget.recipe.globalID == favouriteRecipes[i].globalID) {
                favouriteRecipes.removeAt(i);
              }
            }
          }
        });
      },
      child: Align(
        alignment: const Alignment(0.9, -1),
        child: Icon(
          isBookmarked ? Icons.bookmark_add : Icons.bookmark_add_outlined,
          size: 35,
          color: Colors.yellow,
        ),
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
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
