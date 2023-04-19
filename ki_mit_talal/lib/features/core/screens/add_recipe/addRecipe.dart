import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/controllers/add_recipe_controller.dart';
import 'package:ki_mit_talal/features/core/models/units.dart';
import 'package:ki_mit_talal/features/core/screens/add_recipe/widgets/steps_widget.dart';
import 'package:ki_mit_talal/firebase/recipe_service.dart';

import '../../models/mealtype.dart';
import 'widgets/equipment_widget.dart';
import 'widgets/ingredients_widget.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

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
      body: GetBuilder<AddRecipeController>(
        init: AddRecipeController(),
        builder: (controller) {
          final addkey = GlobalKey<FormState>();

          return SingleChildScrollView(
              child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: addkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Add your own recipe",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: controller.namecontroller,
                      validator: (value) {
                        if(value == null){
                          return "The recipe need a name";
                        }
                        else if(value.isEmpty || value.isNum){
                          return "The recipe need a name";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Recipe name',
                          prefixIcon: Icon(Icons.search_off_outlined)),
                      onChanged: (value) {
                        controller.recipeName.value = value;
                      },
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Number of servings: " +
                              controller.servings.value.ceil().toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Slider(
                              value: controller.servings.value,
                              max: 5,
                              min: 0,
                              divisions: 5,
                              onChanged: ((value) {
                                controller.servings.value = value;
                              }),
                            )),
                      ],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Ingredients",
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
                                itemCount: controller.ingredients.length,
                                itemBuilder: (context, index) {
                                  return IngredientUI(
                                      controller: controller, index: index);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 5,
                            ),
                          ])),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Steps",
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
                                itemCount: controller.steps.length,
                                itemBuilder: (context, index) {
                                  return StepsUI(
                                      controller: controller, index: index);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                          ])),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Equipment",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Summary",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: controller.summarycontroller,
                      maxLines: 6,
                      minLines: 2,
                      validator: (value) {},
                      decoration: InputDecoration(
                          labelText: 'Summary',
                          prefixIcon: Icon(Icons.document_scanner)),
                      onChanged: (value) {
                        controller.summary.value = value.toString();
                      },
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () async {
                          if(addkey.currentState!.validate()){
                            if(controller.addRecipe()){
                              //Get.snackbar("Success", "We saved your recipe",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green.withOpacity(0.3),colorText: Colors.green);
                            }
                          }
                        },
                        child: Text("Add"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ));
        },
      ),
    );
  }
}
