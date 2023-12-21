class Categories {
  final String category;

  Categories({required this.category});

  factory Categories.fromJson(dynamic json) {
    return Categories(
        category: json['displayName'] as String,
        );
  }

  static List<Categories> categoriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Categories.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Category {displayName: $category}';
  }
}