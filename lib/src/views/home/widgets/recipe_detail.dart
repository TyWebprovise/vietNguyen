import 'package:flutter/material.dart';
import 'package:web_provise_test/assets.dart';
import 'package:web_provise_test/src/models/recipe.dart';
import 'package:web_provise_test/src/widgets/network_image_with_fallback.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Stack(
      children: [
        isLandscape
            ? _buildLandscapeView(context)
            : _buildPortraitView(context),
        Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.arrow_back,
                    color: Colors.black, size: 24)),
          ),
        ),
      ],
    );
  }

  Row _buildLandscapeView(BuildContext context) {
    return Row(
      children: [
        NetworkImageWithFallback(
          imageUrl: recipe.image,
          fallbackAsset: Asset.imgRecipePlaceholder,
          width: MediaQuery.of(context).size.width * 0.4,
          height: double.infinity,
          // width: double.infinity,
        ),
        Expanded(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  _buildHeader(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildDiffAndTime(),
                  _buildRecipeNutrition(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildDescription(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Column _buildPortraitView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildRecipeThumb(context),
        NetworkImageWithFallback(
          imageUrl: recipe.image,
          fallbackAsset: Asset.imgRecipePlaceholder,
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
        ),
        Expanded(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  _buildHeader(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildDiffAndTime(),
                  _buildRecipeNutrition(),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildDescription(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Recipe Details
  Row _buildDiffAndTime() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              const Text("Difficulty:",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(recipe.difficulty.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Text("Time:",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(
                width: 4,
              ),
              Text(recipe.time.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipe.name ?? "",
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, height: 1.2),
        ),
        Text(
          recipe.headline ?? "",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Description",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 4,
        ),
        Text(
          recipe.description ?? "",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildRecipeNutrition() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(children: [
                const Text(
                  "Calories: ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(recipe.calories ?? '--',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))
              ]),
            ),
            Expanded(
              child: Row(children: [
                const Text(
                  "Carbos: ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(recipe.carbos ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))
              ]),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(children: [
                const Text(
                  "Fats: ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(recipe.fats ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))
              ]),
            ),
            Expanded(
              child: Row(children: [
                const Text(
                  "Proteins: ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(recipe.proteins ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
