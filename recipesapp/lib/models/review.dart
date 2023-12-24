class Review {
  final String name;
  final String userImage;
  final double rating;
  final String date;
  final String text;

  Review(
      {required this.name,
      required this.userImage,
      required this.rating,
      required this.date,
      required this.text});
  factory Review.fromJson(dynamic json) {
    return Review(
        name: json['user']['profileName'] as String,
        userImage: json['user']['pictureUrl'],
        rating: json['rating'] as double,
        date: json['createTime'] as String,
        text: json['text'] as String);
  }

  static List<Review> reviewsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Review.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Review {name: $name, userImage: $userImage, rating: $rating, date: $date, text: $text}';
  }
}
