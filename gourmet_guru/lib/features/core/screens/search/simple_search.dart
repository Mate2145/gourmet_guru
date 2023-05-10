import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/controllers/simple_search_controller.dart';
import 'package:gourmet_guru/models/recipe.api.dart';

import '../../../../constants/texts.dart';
import '../recipe_details/widgets/searchresult.dart';

class SimpleSearch extends StatelessWidget {
  const SimpleSearch({super.key});

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
        ),
        body: GetBuilder<SimpleSearchController>(
          init: SimpleSearchController(),
          builder: (controller){
          final searchKey = GlobalKey<FormState>();
          return SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: searchKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
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
                            labelText: 'Keyword',
                            prefixIcon: Icon(Icons.search_off_outlined)),
                        onChanged: (value) {
                          controller.query.value = value;
                          print(controller.query.value);
                          //controller.recipeName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (searchKey.currentState!.validate()) {
                            var filter = controller.createFilterfromForm();
                            var resultList =
                                await RecipeAPI.getRecipebyFilter(filter!);
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
              )),
          );
          }
        ),

    );
  }
}
