import 'package:flutter/material.dart';
import 'package:recipesapp/models/review.dart';
import 'package:recipesapp/screens/widgets/review_card.dart';
import 'package:recipesapp/models/recipeAPI.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late List<Review> _reviews;

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.wait([getReviews()]);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getReviews() async {
    _reviews = await RecipeApi.getReviews();
  }

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [],
            ),
    );
  }
}
