import 'package:flutter/material.dart';
import 'package:recipesapp/screens/description.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/models/recipe.dart';

class RecipeCardReduced extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String globalId;
  final String description;

  const RecipeCardReduced({super.key, 
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
              PreviewImage(thumbnailUrl: thumbnailUrl),
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
                    const Spacer(
                      flex: 2,
                    ),
                    RecipeRating(rating: rating),
                    const Spacer(),
                    RecipeTime(cookTime: cookTime)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


//------------------------------------------------


class PreviewImage extends StatelessWidget {
  const PreviewImage({
    super.key,
    required this.thumbnailUrl,
  });

  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.9, 0),
      child: Image(
        image: NetworkImage(thumbnailUrl),
        fit: BoxFit.cover,
        height: 65,
        width: 65,
      ),
    );
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
      child: Row(
        children: [
          const Icon(
            Icons.schedule,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            cookTime,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
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
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(rating, style: const TextStyle(color: Colors.black, fontSize: 14)),
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
      alignment: const Alignment(0, -0.35),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
