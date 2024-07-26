import 'package:flutter/material.dart';
import 'views/recipe_list_screen.dart';
import 'constants.dart';

void main() {
  runApp(RecipesApp());
}

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: RecipeListScreen(),
    );
  }
}