import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:gourmet_guru/features/core/controllers/mealplan_controller.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/widgets/mealplanner_results.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/widgets/searchresult.dart';
import 'package:gourmet_guru/features/core/screens/search/search.dart';
import 'package:gourmet_guru/features/core/screens/search/search_by_ingredient.dart';
import 'package:gourmet_guru/features/core/screens/search/simple_search.dart';
import 'package:gourmet_guru/models/recipe.api.dart';

import '../../models/diets.dart';

class MealPlanGenerator extends StatelessWidget {
  const MealPlanGenerator({super.key});

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
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_circle)),
            )
          ],
        ),
        body: GetBuilder<MealPlanController>(
          init: MealPlanController(),
          builder: (controller) {
          final searchKey = GlobalKey<FormState>();

          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: searchKey,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Generate Your Meal Plan",
                  style: txtTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      initialValue: 'day',
                      readOnly: true,
                      enabled: false,
                      validator: (value) {
                        //return controller.validateQuery(value!);
                      },
                      decoration: InputDecoration(
                          labelText: 'Time Frame',
                          prefixIcon: Icon(Icons.search_off_outlined)),
                      onChanged: (value) {
                        controller.timeFrame.value = value;
                        print(controller.timeFrame.value);
                        //controller.recipeName = value;
                      },
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
                  SizedBox(height: 15,),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Target Calories: " +
                              controller.targetCalories.value.ceil().toString() +
                              " kcal",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.targetCalories.value,
                              max: 5000,
                              min: 0,
                              onChanged: ((value) {
                                controller.targetCalories.value = value;
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
                              "Oops! The target calorie is cannot be 0",
                              style: TextStyle(
                                color:
                                    Colors.red, 
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .bold,
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
                        if (searchKey.currentState!.validate()) {
                          var filter = controller.getParameters();
                          var resultList =
                              await RecipeAPI.generateMealPlan(filter!);
                          if(resultList != null){
                            Get.to(MealPlannerResult(mealPlan: resultList));
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
            )),
          );

          },

        ));
  }
}
