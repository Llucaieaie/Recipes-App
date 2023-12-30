class Recipe {
  final String name;
  final String images;
  final double rating;
  final String time;
  final String globalID;
  final String description;

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.time,
      required this.globalID,
      required this.description
      });

  factory Recipe.fromJson(dynamic json) {
    
    String defaultDescription = "This recipe has no description";

    String description = json['text'] != null && json['text']['text'] != null
        ? json['text']['text'] as String
        : defaultDescription;
        
    return Recipe(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      time: json['totalTime'] as String,
      globalID: json['globalId'] as String,
      // description: json['text']['text'] as String,
      description: description,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $time, globalID: $globalID}';
  }
}
