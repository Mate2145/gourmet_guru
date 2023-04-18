import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/controllers/add_recipe_controller.dart';
import 'package:ki_mit_talal/features/core/models/units.dart';

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: addkey,
            child:
              Column(
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
                  validator: (value) {},
                  decoration: InputDecoration(
                      labelText: 'Recipe name',
                      prefixIcon: Icon(Icons.search_off_outlined)),
                  onChanged: (value) {},
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
                              return IngredientUI(controller: controller,index: index);
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
                              return StepsUI(controller: controller,index: index);
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                  ])),
              Center(
                child: SizedBox(
                  width: 260,
                  child: ElevatedButton(
                    onPressed: () async {},
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

class IngredientUI extends StatelessWidget {
  const IngredientUI({
    required this.controller,
    required this.index,
    super.key,
  });

  final AddRecipeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Ingredient name",
                  ),
                  controller: controller.ingredientNameController,
                  onSaved: (newValue) {
                    controller.ingredients[index].name = newValue.toString();
                  },
                ),
              ),
              Visibility(
                child: SizedBox(
                  width: 25,
                  child: IconButton(
                    icon: Icon(Icons.add,color: Colors.green,),
                    splashRadius: 25,
                  onPressed: () {
                    controller.addEmptyIngredient(index+1);
                  },),
                ),
                visible: index == controller.ingredients.length - 1,
              ),
              SizedBox(width: 5,),
              Visibility(
                child: SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.red,
                      fill: 1,
                    ),
                    padding: EdgeInsets.only(right: 3),
                    splashRadius: 25,
                    splashColor: Colors.red,
                    onPressed: () {
                      controller.removeIngredientatIndex(index);
                    },
                  ),
                ),
                visible: index > 0 ,
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Amount",
                  ),
                  controller: controller.ingredientAmountController,
                  onSaved: (newValue) {
                    controller.ingredients[index].amount = newValue as num;
                  },
                ),
              ),
              Flexible(
                child: Obx(
                  () => DropdownButtonFormField<IngUnit>(
                    value: controller.selectedUnit.value,
                    items: IngUnit.values.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit.name.toString()),
                      );
                    }).toList(),
                    onChanged: (unit) {
                      controller.ingredients[index].unit = unit.toString();
                      controller.selectedUnit.value = unit!;
                      print(controller.selectedUnit.value);
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: ggPrimaryColor,
                    ),
                    dropdownColor: ggWhite,
                    decoration: InputDecoration(
                    labelText: "Unit",
                  ),
                ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class StepsUI extends StatelessWidget {
  const StepsUI({
    required this.controller,
    required this.index,
    super.key,
  });

  final AddRecipeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "${index + 1}. step",
                  ),
                  controller: controller.stepController,
                  onSaved: (newValue) {
                    controller.steps[index].step = newValue.toString();
                  },
                ),
              ),
              Visibility(
                child: SizedBox(
                  width: 25,
                  child: IconButton(
                    icon: Icon(Icons.add,color: Colors.green,),
                    splashRadius: 25,
                  onPressed: () {
                    controller.addEmtpyStep(index+1);
                  },),
                ),
                visible: index == controller.steps.length - 1,
              ),
              SizedBox(width: 5,),
              Visibility(
                child: SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.red,
                      fill: 1,
                    ),
                    padding: EdgeInsets.only(right: 3),
                    splashRadius: 25,
                    splashColor: Colors.red,
                    onPressed: () {
                      controller.removeStepsatIndex(index);
                    },
                  ),
                ),
                visible: index > 0 ,
              ),
            ],
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}


class EquipmentUI extends StatelessWidget {
  const EquipmentUI({
    required this.controller,
    required this.index,
    super.key,
  });

  final AddRecipeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Equipment",
                  ),
                  controller: controller.stepController,
                  onSaved: (newValue) {
                    controller.steps[index].step = newValue.toString();
                  },
                ),
              ),
              Visibility(
                child: SizedBox(
                  width: 25,
                  child: IconButton(
                    icon: Icon(Icons.add,color: Colors.green,),
                    splashRadius: 25,
                  onPressed: () {
                    controller.addEmtpyStep(index+1);
                  },),
                ),
                visible: index == controller.steps.length - 1,
              ),
              SizedBox(width: 5,),
              Visibility(
                child: SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.red,
                      fill: 1,
                    ),
                    padding: EdgeInsets.only(right: 3),
                    splashRadius: 25,
                    splashColor: Colors.red,
                    onPressed: () {
                      controller.removeStepsatIndex(index);
                    },
                  ),
                ),
                visible: index > 0 ,
              ),
            ],
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
