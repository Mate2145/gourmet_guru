import 'dart:convert';
import 'package:gourmet_guru/api_keys.dart';
import 'package:gourmet_guru/features/core/models/analyedinstructionlist.dart';
import 'package:gourmet_guru/features/core/models/analyzedInstructions.dart';
import 'package:gourmet_guru/models/recipe.dart';
import 'package:http/http.dart' as http;

import '../features/core/models/filter.dart';
import '../features/core/models/recipe_detail.dart';

class RecipeAPI {
  RecipeAPI._instantiate();
  static final RecipeAPI instance = RecipeAPI._instantiate();

  final String baseURL = "api.spoonacular.com";

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("api.spoonacular.com", "/recipes/complexSearch", {
      "query": "chicken",
      "maxFat": "25",
      "number": "4",
      "apiKey": RecipeAPIString,
    });
    print(uri);
    final response = await http.get(uri);
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['results']) {
      _temp.add(i);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }

  static Future<List<Recipe>> getRecipebyFilter(Filter filter) async {
    Map<String, dynamic>? parameters = getParametersbyFilter(filter);
    if (parameters == null) {
      return [];
    }
    var uri =
        Uri.https("api.spoonacular.com", "/recipes/complexSearch", parameters);

    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List _temp = [];
      for (var i in data['results']) {
        _temp.add(i);
      }
      return Recipe.recipesFromSnapshot(_temp);
    } else {
      return [];
    }
  }

  static Map<String, dynamic>? getParametersbyFilter(Filter? filter) {
    Map<String, dynamic>? parameters = {};

    parameters['query'] = filter!.query;

    parameters['number'] = "5";
    //Cuisine
    if (filter?.cuisine?.isNotEmpty == true) {
      parameters['cuisine'] = filter!.cuisine;
    }
    //Diet
    if (filter?.diet?.isNotEmpty == true) {
      parameters['diet'] = filter!.diet;
    }
    //Intolerance
    if (filter?.intolerances?.isNotEmpty == true) {
      parameters['intolerances'] = filter!.intolerances;
    }
    //Equipment
    if (filter?.equipment?.isNotEmpty == true) {
      parameters['equipment'] = filter!.equipment;
    }
    //MealType
    if (filter?.mealType?.isNotEmpty == true) {
      parameters['type'] = filter!.type;
    }
    //Cooktime
    if (filter?.maxReadyTime != null) {
      parameters['maxReadyTime'] = filter!.maxReadyTime;
    }
    //Min Calories
    if (filter?.minCalories != null) {
      parameters['minCalories'] = filter!.minCalories;
    }
    //Max Calories
    if (filter?.maxCalories != null) {
      parameters['maxCalories'] = filter!.maxCalories;
    }
    // Min protein
    if (filter?.minProtein != null) {
      parameters['minProtein'] = filter!.minProtein;
    }

    // Max protein
    if (filter?.maxProtein != null) {
      parameters['maxProtein'] = filter!.maxProtein;
    }

    // Min carbs
    if (filter?.minCarbs != null) {
      parameters['minCarbs'] = filter!.minCarbs;
    }

    // Max carbs
    if (filter?.maxCarbs != null) {
      parameters['maxCarbs'] = filter!.maxCarbs;
    }

    // Min fat
    if (filter?.minFat != null) {
      parameters['minFat'] = filter!.minFat;
    }

    // Max fat
    if (filter?.maxFat != null) {
      parameters['maxFat'] = filter!.maxFat;
    }
    parameters['apiKey'] = RecipeAPIString;
    return parameters.length > 0 ? parameters : null;
  }

  static Future<RecipeDetailed> fetchRecipeDetails(int recipeId) async {
    final apiUrl = 'https://api.spoonacular.com/recipes/$recipeId/information';

    final response =
        await http.get(Uri.parse('$apiUrl?apiKey=' + RecipeAPIString));

    if (response.statusCode == 200) {
      print("FetchRecipe OK");
      final json = jsonDecode(response.body);
      RecipeDetailed recipe = RecipeDetailed.fromJson(json);
      AnalyzedInstructionsList list =
          await getAnalyedInstructionsListbyID(recipeId);
      recipe.instructionList = list.instructions;
      return recipe;
    } else {
      throw Exception('Failed to load recipe details: ${response.statusCode}');
    }
  }

  static Future<AnalyzedInstructions> getAnalyedInstructionsbyID(
      int recipeID) async {
    final apiUrl =
        'https://api.spoonacular.com/recipes/$recipeID/analyzedInstructions';

    final response =
        await http.get(Uri.parse('$apiUrl?apiKey=' + RecipeAPIString));

    if (response.statusCode == 200) {
      print("AnalyedInstructions OK");
      final json = jsonDecode(response.body);
      return AnalyzedInstructions.fromJson(json);
    } else {
      throw Exception(
          'Failed to load analyzed instructions: ${response.statusCode}');
    }
  }

  static Future<AnalyzedInstructionsList> getAnalyedInstructionsListbyID(
      int recipeID) async {
    final apiUrl =
        'https://api.spoonacular.com/recipes/$recipeID/analyzedInstructions';

    final response =
        await http.get(Uri.parse('$apiUrl?apiKey=' + RecipeAPIString));

    if (response.statusCode == 200) {
      print("AnalyedInstructionsList OK");
      final json = jsonDecode(response.body);
      return AnalyzedInstructionsList.fromJson(json);
    } else {
      throw Exception(
          'Failed to load analyzed instructions: ${response.statusCode}');
    }
  }

  static Future<List<Recipe>> getRecipesByIngredients(String ingredients,
      {int number = 10}) async {
    Map<String, dynamic> parameters = {
      'ingredients': ingredients,
      'number': number.toString(),
    };

    var uri = Uri.https(
        "api.spoonacular.com", "/recipes/findByIngredients", parameters);

    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Recipe> _temp = [];
      for (var recipe in data) {
        _temp.add(Recipe.fromJson(recipe));
      }
      return _temp;
    } else {
      return [];
    }
  }

  static Future<List<Recipe>> generateMealPlan(
      String timeFrame, int targetCalories, String diet) async {
    Map<String, dynamic> parameters = {
      'timeFrame': timeFrame,
      'targetCalories': targetCalories.toString(),
      'diet': diet,
    };

    var uri =
        Uri.https("api.spoonacular.com", "/mealplanner/generate", parameters);

    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List _temp = [];
      for (var meal in data['meals']) {
        _temp.add(meal);
      }
      return Recipe.recipesFromSnapshot(_temp);
    } else {
      return [];
    }
  }
}
