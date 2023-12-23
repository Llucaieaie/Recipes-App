import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Date posted",
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
              child: RatingBar(rating: 4),
            )
          ],
        ),
      ],
    );
  }
}
