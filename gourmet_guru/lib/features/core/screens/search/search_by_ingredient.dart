import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/controllers/searchingreident_controller.dart';
import 'package:gourmet_guru/features/core/controllers/simple_search_controller.dart';
import 'package:gourmet_guru/features/core/screens/search/widgets/ingredient_string.dart';
import 'package:gourmet_guru/models/recipe.api.dart';

import '../../../../constants/texts.dart';
import '../recipe_details/widgets/searchresult.dart';

class SearchByIngredients extends StatelessWidget {
  const SearchByIngredients({super.key});

  @override
  Widget build(BuildContext context) {
        //Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(ggAppTitle, style: Theme.of(context).textTheme.headline5),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: GetBuilder<SearchByIngredientsController>(
          init: SearchByIngredientsController(),
          builder: (controller){
          final searchKey = GlobalKey<FormState>();
          return SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: searchKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Whats in your fridge",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.ingredientlist.length,
                                itemBuilder: (context, index) {
                                  return IngredientsListUI(
                                      controller: controller, index: index);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                          ])),
                    SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (searchKey.currentState!.validate()) {
                            var ingredients = controller.appendIngredients();
                            if(ingredients.isNotEmpty){
                                var resultList =
                                  await RecipeAPI.getRecipesByIngredients(ingredients);
                                  Get.to(SearchResult(searchList: resultList));
                            }
                          }
                          searchKey.currentState!.save();
                        },
                        child: Text("SEARCH"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
          );
          }
        ),

    );
  }
}
