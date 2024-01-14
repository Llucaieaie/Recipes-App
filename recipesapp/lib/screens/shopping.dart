import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/ingredients.dart';

class Shopping extends StatefulWidget {
  final String name;
  final int quantity;

  Shopping({
    required this.name,
    required this.quantity,
  });

  @override
  _ShoppingState createState() => _ShoppingState();

  // Define a static method to add shopping ingredients
  static void addShoppingIngredient(List<Ingredient> shoppingIngredients, String name, int quantity) {
    shoppingIngredients.add(Ingredient(
      leftText: name,
      middleText: '${quantity} ${quantity > 1 ? 'PCS' : 'PC'}',
      startColor: Color.fromARGB(255, 140, 236, 111),
      endColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 18,
    ));
  }
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
          Text('$shoppingIngredients',
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  // Call the static method to add a shopping ingredient
  void _addShoppingIngredient() {
    setState(() {
      Shopping.addShoppingIngredient(shoppingIngredients, widget.name, widget.quantity);
    });
  }
}

