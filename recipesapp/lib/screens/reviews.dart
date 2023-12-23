import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5.0,
        shadowColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant),
            SizedBox(width: 10),
            Text('Favourite'),
          ],
        ),
      ),
      body: const Column(
        children: [
          ReviewCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, //_currentIndex,
        // onTap: (index) {
        //   // Handle navigation to different pages based on index
        //   setState(() {
        //     _currentIndex = index;
        //     // Add logic to navigate to different pages based on index
        //   });
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Shopping list',
          ),
        ],
      ),
    );
  }
}
