import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/rating_bar.dart';

class ReviewCard extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String rating;
  final String date;
  final String text;
  const ReviewCard(
      {super.key,
      required this.userName,
      required this.userImageUrl,
      required this.rating,
      required this.date,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 23,
                backgroundImage: NetworkImage(userImageUrl),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: RatingBar(
                rating: double.parse(rating),
              ),
            )
          ],
        ),
      ],
    );
  }
}
