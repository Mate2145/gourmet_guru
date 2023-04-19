import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/controllers/my_recipe_controller.dart';
import 'package:ki_mit_talal/features/core/models/recipe_detail.dart';
import 'package:ki_mit_talal/features/core/screens/recipe_details/recipe_details_screen.dart';

class MyRecipes extends StatelessWidget {
  const MyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final controller = Get.put(MyRecipeController());
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
            child: FutureBuilder<List<RecipeDetailed>>(
              future: controller.getRecipes(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    List<RecipeDetailed> recipeList = snapshot.data as List<RecipeDetailed>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipeList.length,
                      itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.green,
                            tileColor: Colors.green.withOpacity(0.5),
                            leading: const Icon(Icons.restaurant_outlined),
                            title: Text("${recipeList[index].title}"),
                            trailing: Container(
                              width: 48,
                              child: Row(children: [
                                IconButton(onPressed: () {
                                  controller.removeRecipe(recipeList[index]);
                                },
                                icon: Icon(Icons.remove),
                                splashRadius: 20,)
                              ]),
                            ),
                            onTap: () {
                              Get.to(() => RecipeDetailScreen(recipe: recipeList[index]));
                            },
                          ),
                          const SizedBox(height: 10,),
                        ],
                      );
                    }));
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }
                else{
                  return CircularProgressIndicator();
                }
              }),
          )));
  }
}