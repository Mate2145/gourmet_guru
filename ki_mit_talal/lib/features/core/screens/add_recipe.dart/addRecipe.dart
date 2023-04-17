import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/controllers/add_recipe_controller.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

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
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Add your own recipe",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
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
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.ingredients.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Ingredient Name',
                                      ),
                                      controller:
                                          controller.ingredientNameController,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }),
                        SizedBox(
                          width: 260,
                          child: ElevatedButton(
                            onPressed: () async {
                              //controller.addIngredient()
                            },
                            child: Text("Add Ingredient"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ])),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () async {},
                  child: Text("Add"),
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
