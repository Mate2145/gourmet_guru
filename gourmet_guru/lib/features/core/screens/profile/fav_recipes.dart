import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/constants/sizes.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/core/controllers/fav_recipe_controller.dart';
import 'package:gourmet_guru/features/core/controllers/my_recipe_controller.dart';
import 'package:gourmet_guru/features/core/models/favrecipemodell.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/recipe_details_screen.dart';
import 'package:gourmet_guru/models/recipe.api.dart';
import 'package:gourmet_guru/utils/storage.dart';

class FavRecipes extends StatelessWidget {
  const FavRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final controller = Get.put(FavRecipeController());
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(ggAppTitle, style: Theme.of(context).textTheme.headline5),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(ggDefaultSize),
          child: FutureBuilder<List<FavRecipeModell>>(
              future: controller.getRecipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    controller.recipeList.value =
                        snapshot.data as List<FavRecipeModell>;
                    return Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.recipeList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  iconColor: Colors.green,
                                  tileColor: Colors.green.withOpacity(0.5),
                                  leading:
                                      const Icon(Icons.restaurant_outlined),
                                  title: Text(
                                      "${controller.recipeList[index].title}"),
                                  trailing: Container(
                                    width: 48,
                                    child: Row(children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.removeRecipe(
                                              controller.recipeList[index]);
                                        },
                                        icon: Icon(Icons.remove),
                                        splashRadius: 20,
                                      )
                                    ]),
                                  ),
                            onTap: () async {
                            final recipeId = controller.recipeList[index].id;
                            if (MapStorage.isContainsRecipeDetailbyID(
                                recipeId)) {
                              // Recipe details are already available, display the recipe detail screen
                              final recipeDetails =
                                  MapStorage.getRecipeDetails(recipeId)!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipeDetailScreen(
                                      recipe: recipeDetails)),
                                ),
                              );
                            } else {
                              // Recipe details are not yet available, load them from the API
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => FutureBuilder(
                                        future: RecipeAPI.fetchRecipeDetails(
                                            recipeId),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            // Recipe details are available, display the recipe detail screen
                                            final recipeDetails =
                                                snapshot.data as RecipeDetails;
                                            MapStorage.addRecipeDetails(
                                                recipeId, recipeDetails);
                                            return RecipeDetailScreen(
                                                recipe: recipeDetails);
                                          } else if (snapshot.hasError) {
                                            // An error occurred while loading the recipe details
                                            return Text(
                                                'Error loading recipe details');
                                          } else {
                                            // Recipe details are still loading, display a loading indicator
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        },
                                      )),
                                ),
                              );
                            }
                          },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          })),
                    );
                  } else {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Fetching data",
                            style: txtTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                    //return CircularProgressIndicator();
                  }
                } else {
                  return Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Fetching data",
                            style: txtTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
                }
              }),
        )));
  }
}