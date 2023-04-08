import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/models/recipe.dart';
import 'package:ki_mit_talal/widgets/recipe_card.dart';

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
                  return RecipeCard(
                    title: controller.recipes[index].title,
                    thumbnailUrl: controller.recipes[index].image,
                  );
                },
              ),
      ),
    );
  }
}