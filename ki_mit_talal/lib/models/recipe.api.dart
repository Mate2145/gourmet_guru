import 'dart:convert';
import 'package:ki_mit_talal/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeAPI {

  static Future<List<Recipe>> getRecipe() async{
      var uri = Uri.https("api.spoonacular.com","/recipes/complexSearch",{
        "query":"pasta",
        "maxFat":"25",
        "number":"2",
        "apiKey": "83b3c3a9c5544e2f8be3f4c3dd3dff23"
      });

      print(uri);

      final response = await http.get(uri);

      Map data = jsonDecode(response.body);
      List _temp = [];

      for (var i in data['results'])
      {
          _temp.add(i);  
      }

      return Recipe.recipesFromSnapshot(_temp);


  }
}