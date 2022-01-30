import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';

import 'package:provider/provider.dart';
import 'package:fooderlich/models/models.dart';

import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<GroceryManager>(context, listen: false).createNewItem();
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          return GroceryListScreen(
            manager: manager,
          );
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
