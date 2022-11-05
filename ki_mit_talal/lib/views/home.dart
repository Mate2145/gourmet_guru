import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:ki_mit_talal/models/recipe.api.dart';
import 'package:ki_mit_talal/models/recipe.dart';
import 'package:ki_mit_talal/widgets/recipe_card.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  late List<Recipe> recipes;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
    recipes = await RecipeAPI.getRecipe();
    setState(() {
      isloading = false;
    });
    print(recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text("Food Recipe")
        ],),
      ),
      body: isloading 
      ? Center(child: CircularProgressIndicator())
       : ListView.builder(
        itemCount:  recipes.length,
        itemBuilder: (context, index)
        {
          return RecipeCard(
            title: recipes[index].title,
            cookTime: "30 min",
            rating: "Kurvajo",
            thumbnailUrl: recipes[index].image);}
    ));
  }

}

