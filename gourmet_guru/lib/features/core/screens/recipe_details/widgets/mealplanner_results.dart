import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/controllers/mealplanner_result_controller.dart';
import 'package:gourmet_guru/features/core/models/mealplan.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/recipe_details_screen.dart';
import 'package:gourmet_guru/models/recipe.api.dart';
import 'package:gourmet_guru/models/recipe.dart';
import 'package:gourmet_guru/utils/storage.dart';
import 'package:gourmet_guru/widgets/recipe_card.dart';

import '../../../controllers/search_result_controller.dart';

class MealPlannerResult extends StatelessWidget {
  final MealPlan mealPlan;

  MealPlannerResult({required this.mealPlan});

  @override
  Widget build(BuildContext context) {

    final txtTheme = Theme.of(context).textTheme;
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
      body: GetBuilder<MealPlannerResultController>(
        init: MealPlannerResultController(mealPlan),
        builder: (controller) => controller.isloading
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text('Calories: ' + controller.nutrients.calories.toStringAsFixed(2),style: txtTheme.headlineSmall,),
                    SizedBox(height: 20,),
                    Text(
                        'Carbohydrates: ' + controller.nutrients.carbohydrates.toStringAsFixed(2) + ' g',style: txtTheme.headlineSmall,),
                    SizedBox(height: 20,),
                    Text('Fat: ' + controller.nutrients.fat.toStringAsFixed(2) + 'g',style: txtTheme.headlineSmall,),
                    SizedBox(height: 20,),
                    Text('Protein: ' + controller.nutrients.protein.toStringAsFixed(2) + 'g',style: txtTheme.headlineSmall,),
                    Divider(),
                    SizedBox(height: 20,)
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
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
                      child: 
                        Column(
                          children: [
                            if(index == 0)
                            Switch(text: 'Breakfast',),
                            if(index == 1)
                            Switch(text: 'Lunch',),
                            if(index == 2)
                            Switch(text: 'Dinner',),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                              iconColor: Colors.green,
                              tileColor: Colors.green.withOpacity(0.5),
                              leading: const Icon(Icons.restaurant_outlined),
                              title: Text("${controller.recipes[index].title}"),
                              ),
                            ),
                          ],
                        ),
                    );
                  },
                ),
              ]),
      ),
    );
  }
}

class Switch extends StatelessWidget {
  final String text;

  Switch({required this.text});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Column(children: [
      Text(this.text,style: txtTheme.headlineSmall),
      SizedBox(height: 15,),
    ],);
  }
}
