import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/recipe_bloc.dart';
import '../controllers/recipe_event.dart';
import '../controllers/recipe_state.dart';
import '../models/recipe.dart';
import '../constants.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocProvider(
        create: (context) => RecipeBloc()..add(FetchRecipes()),
        child: RecipeListView(),
      ),
    );
  }
}

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecipeLoaded) {
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              Recipe recipe = state.recipes[index];
              return _buildRecipeCard(context, recipe);
            },
          );
        } else if (state is RecipeError) {
          return Center(child: Text('Failed to load recipes: ${state.message}'));
        } else {
          return Center(child: Text('No Recipes'));
        }
      },
    );
  }

  Widget _buildRecipeCard(BuildContext context, Recipe recipe) {
    return Card(
      elevation: kCardElevation,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _buildRecipeImage(recipe.thumb),
        title: Text(
          recipe.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          recipe.headline,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(recipe: recipe),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecipeImage(String thumbUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        thumbUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}