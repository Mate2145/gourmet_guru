import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/recipe_details_screen.dart';
import 'package:gourmet_guru/models/recipe.api.dart';
import 'package:gourmet_guru/models/recipe.dart';
import 'package:gourmet_guru/utils/storage.dart';
import 'package:gourmet_guru/widgets/recipe_card.dart';

import '../../../controllers/search_result_controller.dart';

class SearchResult extends StatelessWidget {
  final List<Recipe> searchList;

  SearchResult({required this.searchList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("GourmetGuru")
          ],
        ),
      ),
      body: GetBuilder<SearchResultController>(
        init: SearchResultController(searchList),
        builder: (controller) => controller.isloading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final recipeId = controller.recipes[index].id;
                      if (MapStorage.isContainsRecipeDetailbyID(recipeId)) {
                        final recipeDetails =
                            MapStorage.getRecipeDetails(recipeId)!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                RecipeDetailScreen(recipe: recipeDetails)),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => FutureBuilder(
                                  future:
                                      RecipeAPI.fetchRecipeDetails(recipeId),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final recipeDetails =
                                          snapshot.data as RecipeDetails;
                                      MapStorage.addRecipeDetails(
                                          recipeId, recipeDetails);
                                      return RecipeDetailScreen(
                                          recipe: recipeDetails);
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          'Error loading recipe details');
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                )),
                          ),
                        );
                      }
                    },
                    child: RecipeCard(
                      title: controller.recipes[index].title,
                      thumbnailUrl: controller.recipes[index].image,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
