import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/maindisplay/maindisplay.dart';
import 'package:ki_mit_talal/features/core/models/cuisines.dart';
import 'package:ki_mit_talal/features/core/models/diets.dart';
import 'package:ki_mit_talal/features/core/models/intolerances.dart';
import 'package:ki_mit_talal/features/core/models/mealtype.dart';
import 'package:ki_mit_talal/features/core/screens/recipe_details/widgets/searchresult.dart';
import 'package:ki_mit_talal/features/core/screens/search/search_menu.dart';
import 'package:ki_mit_talal/models/recipe.api.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';
import 'package:ki_mit_talal/views/home.dart';

import '../../controllers/search_controller.dart';
import '../navbar/navigationbar.dart';

class Search extends StatelessWidget {
  Search({super.key});
  final RecipeSearchController controller = Get.put(RecipeSearchController());

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.off(() => MainDisplay());
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text(ggAppTitle, style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
            ),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          )
        ],
      ),
      body: GetBuilder<RecipeSearchController>(
        init: RecipeSearchController(),
        builder: (controller) {
          final searchKey = GlobalKey<FormState>();

          return SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: searchKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Search a recipe",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (value) {
                        return controller.validateQuery(value!);
                      },
                      decoration: InputDecoration(
                          labelText: 'Recipe name',
                          prefixIcon: Icon(Icons.search_off_outlined)),
                      onChanged: (value) {
                        controller.query.value = value;
                        print(controller.query.value);
                        //controller.recipeName = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(
                      () => DropdownButtonFormField<Cuisine>(
                        value: controller.selectedCuisine.value,
                        items: Cuisine.values.map((cuisine) {
                          return DropdownMenuItem(
                            value: cuisine,
                            child: Text(cuisine.name.toString()),
                          );
                        }).toList(),
                        onChanged: (cuisine) {
                          controller.selectedCuisine.value = cuisine!;
                          print(controller.selectedCuisine.value);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: ggPrimaryColor,
                        ),
                        dropdownColor: ggWhite,
                        decoration: InputDecoration(
                            labelText: "Cuisines",
                            prefixIcon: Icon(Icons.add_circle_outline)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(
                      () => DropdownButtonFormField<Diet>(
                        value: controller.selectedDiet.value,
                        items: Diet.values.map((diet) {
                          return DropdownMenuItem(
                            value: diet,
                            child: Text(diet.name.toString()),
                          );
                        }).toList(),
                        onChanged: (diet) {
                          controller.selectedDiet.value = diet!;
                          print(controller.selectedDiet.value);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: ggPrimaryColor,
                        ),
                        dropdownColor: ggWhite,
                        decoration: InputDecoration(
                            labelText: "Diets",
                            prefixIcon: Icon(Icons.add_circle_outline)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(
                      () => DropdownButtonFormField<Intolerances>(
                        value: controller.selectedIntolerance.value,
                        items: Intolerances.values.map((intolerance) {
                          return DropdownMenuItem(
                            value: intolerance,
                            child: Text(intolerance.name.toString()),
                          );
                        }).toList(),
                        onChanged: (intolerance) {
                          controller.selectedIntolerance.value = intolerance!;
                          print(controller.selectedIntolerance.value);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: ggPrimaryColor,
                        ),
                        dropdownColor: ggWhite,
                        decoration: InputDecoration(
                            labelText: "Intolerances",
                            prefixIcon: Icon(Icons.add_circle_outline)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Equipment',
                          prefixIcon: Icon(Icons.search_off_outlined)),
                      onChanged: (value) {
                        controller.equipment.value = value;
                        print(controller.equipment.value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(
                      () => DropdownButtonFormField<MealType>(
                        value: controller.selectedMealType.value,
                        items: MealType.values.map((mealtype) {
                          return DropdownMenuItem(
                            value: mealtype,
                            child: Text(mealtype.name.toString()),
                          );
                        }).toList(),
                        onChanged: (mealtype) {
                          controller.selectedMealType.value = mealtype!;
                          print(controller.selectedMealType.value);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: ggPrimaryColor,
                        ),
                        dropdownColor: ggWhite,
                        decoration: InputDecoration(
                            labelText: "Meal Type",
                            prefixIcon: Icon(Icons.add_circle_outline)),
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Maximum ready time: " +
                              controller.cookTime.value.ceil().toString() +
                              " min",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.cookTime.value,
                              max: 120,
                              min: 0,
                              onChanged: ((value) {
                                controller.cookTime.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.information.value =
                                !controller.information.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Show Instructions",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        if (!controller.information.value)
                          SizedBox(
                            height: 15,
                          ),
                        if (controller.information.value)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "The minimum amount of [insert nutrient of interest, such as protein, carbohydrates, or calories] in grams or units that the recipe must have per serving.",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Minimum calories: " +
                              controller.minCalories.value.ceil().toString() +
                              " kcal",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.minCalories.value,
                              max: 3000,
                              min: 0,
                              onChanged: ((value) {
                                controller.minCalories.value = value;
                                controller.validateNutritions(
                                    controller.minCalories.value,
                                    controller.maxCalories.value);
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Maximum calories: " +
                              controller.maxCalories.value.ceil().toString() +
                              " kcal",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.maxCalories.value,
                              max: 3000,
                              min: 0,
                              onChanged: ((value) {
                                controller.maxCalories.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Minimum protein: " +
                              controller.minProtein.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.minProtein.value,
                              max: 100,
                              min: 0,
                              onChanged: ((value) {
                                controller.minProtein.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Maximum protein: " +
                              controller.maxProtein.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.maxProtein.value,
                              max: 100,
                              min: 0,
                              onChanged: ((value) {
                                controller.maxProtein.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Minimum carbs: " +
                              controller.minCarbs.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.minCarbs.value,
                              max: 325,
                              min: 0,
                              onChanged: ((value) {
                                controller.minCarbs.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Maximum carbs: " +
                              controller.maxCarbs.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.maxCarbs.value,
                              max: 325,
                              min: 0,
                              onChanged: ((value) {
                                controller.maxCarbs.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Minimum fat: " +
                              controller.minFat.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.minFat.value,
                              max: 80,
                              min: 0,
                              onChanged: ((value) {
                                controller.minFat.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Maximum fat: " +
                              controller.maxFat.value.ceil().toString() +
                              " g",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.maxFat.value,
                              max: 80,
                              min: 0,
                              onChanged: ((value) {
                                controller.maxFat.value = value;
                              }),
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        if (controller.sliderError.value)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Oops! The minimum value of the slider cannot be greater than the maximum value. Please adjust your selections and try again.",
                              style: TextStyle(
                                color:
                                    Colors.red, // set the color property to red
                                fontSize: 16, // set the font size to 16
                                fontWeight: FontWeight
                                    .bold, // set the font weight to bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(searchKey.currentState!.validate()){
                          var filter = controller.createFilterfromForm();
                          var resultList = await RecipeAPI.getRecipebyFilter(filter!);
                          Get.to(SearchResult(searchList: resultList));
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
            ),
          );
        },
      ),
    );
  }
}
