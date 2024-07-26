import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../constants.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(recipe.image),
            SizedBox(height: 16),
            _buildText(recipe.headline, kTextStyleTitle),
            SizedBox(height: 16),
            _buildText(recipe.description, kTextStyleDescription),
            SizedBox(height: 16),
            Divider(),
            _buildInfoGrid(recipe),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(imageUrl),
    );
  }

  Widget _buildText(String text, TextStyle style) {
    return Text(text, style: style);
  }

  Widget _buildInfoGrid(Recipe recipe) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        childAspectRatio: 4,
      ),
      children: [
        _buildInfoChip('Calories', recipe.calories),
        _buildInfoChip('Carbos', recipe.carbos),
        _buildInfoChip('Fats', recipe.fats),
        _buildInfoChip('Proteins', recipe.proteins),
        _buildInfoChip('Time', recipe.time),
        _buildInfoChip('Difficulty', recipe.difficulty.toString()),
      ],
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        label: Text(
          '$label: $value',
          style: TextStyle(
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        backgroundColor: kChipBackgroundColor.withOpacity(0.1),
      ),
    );
  }
}