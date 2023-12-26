import 'package:flutter/material.dart';
import 'package:recipesapp/models/review.dart';
import 'package:recipesapp/screens/widgets/rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviews,
    required this.reviewID,
  });

  final List<Review> reviews;
  final int reviewID;
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
                backgroundImage: NetworkImage(reviews[reviewID].userImage),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviews[reviewID].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  reviews[reviewID].date,
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
                rating: reviews[reviewID].rating.toDouble(),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  " '" + reviews[reviewID].text + "'",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 54, 67, 73)),
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 0.3,
          color: Colors.grey,
        )
      ],
    );
  }
}
