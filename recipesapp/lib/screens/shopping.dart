import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/ingredients.dart';

class Shopping extends StatefulWidget {
  final String name;
  final int quantity;
  final double price;

  Shopping({
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<Ingredient> shoppingIngredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        backgroundColor: const Color.fromARGB(255, 123, 204, 126),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _addShoppingIngredient();
            },
            child: Text('Add Shopping Ingredient'),
          ),
        ],
      ),
    );
  }

  void _addShoppingIngredient() {
    setState(() {
      shoppingIngredients.add(Ingredient(
        leftText: widget.name,
        middleText: '${widget.quantity} ${widget.quantity > 1 ? 'PCS' : 'PC'}',
        startColor: Color.fromARGB(255, 140, 236, 111),
        endColor: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 18,
      ));
    });
  }
}