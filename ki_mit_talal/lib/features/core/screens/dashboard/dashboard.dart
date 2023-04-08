import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/models/recipe.api.dart';
import 'package:ki_mit_talal/utils/storage.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';

import '../../../../models/recipe.api.dart';
import '../../../../models/recipe.dart';
import '../../../../widgets/recipe_card.dart';
import '../../models/recipe_detail.dart';
import '../navbar/navigationbar.dart';
import '../recipe_details/recipe_details_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late List<Recipe> recipes;
  bool isloading = true;
  Map<int, RecipeDetailed> recipeDetailsMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getRecipes();
  }

  Future<void> getRecipes() async {
    recipes = await RecipeAPI.getRecipe();
    setState(() {
      isloading = false;
    });
    print(recipes);
  }

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Text(ggAppTitle, style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(ggDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              dashBoardTitle1,
              style: txtTheme.headline4,
            ),
            const SizedBox(
              height: ggDefaultSize,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(width: 4)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search a recipe",
                    style: txtTheme.headline5
                        ?.apply(color: Colors.grey.withOpacity(0.5)),
                  ),
                  const Icon(Icons.mic, size: 25),
                ],
              ),
            ),
            const SizedBox(
              height: ggDefaultSize,
            ),
            Text(
              "Chicken",
              style: txtTheme.headline6,
            ),
            Container(
              height: 200,
              child: isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final recipeId = recipes[index].id;
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
                                                snapshot.data as RecipeDetailed;
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
                          child: RecipeCard(
                              title: recipes[index].title,
                              thumbnailUrl: recipes[index].image),
                        );
                      }),
            )
          ],
        ),
      )),
    );
  }
}
