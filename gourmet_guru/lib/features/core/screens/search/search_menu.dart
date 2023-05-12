import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:gourmet_guru/features/core/screens/search/mealplan_generator.dart';
import 'package:gourmet_guru/features/core/screens/search/search.dart';
import 'package:gourmet_guru/features/core/screens/search/search_by_ingredient.dart';
import 'package:gourmet_guru/features/core/screens/search/simple_search.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose a search page",
              style: txtTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(() => SimpleSearch());
                },
                child: Text("Simple Search"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(() => Search());
                },
                child: Text("Complex Search"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(() => SearchByIngredients());
                },
                child: Text("Search by Ingredients"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(() => MealPlanGenerator());
                },
                child: Text("Genereate Meal Plan"),
              ),
            ),
          ],
        )));
  }
}
