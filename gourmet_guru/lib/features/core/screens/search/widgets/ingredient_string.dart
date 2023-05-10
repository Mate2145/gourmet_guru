import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/controllers/add_recipe_controller.dart';
import 'package:gourmet_guru/features/core/controllers/searchingreident_controller.dart';

class IngredientsListUI extends StatelessWidget {
  const IngredientsListUI({
    required this.controller,
    required this.index,
    super.key,
  });

  final SearchByIngredientsController controller;
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
                    labelText: "${index + 1}. ingredient",
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "You must fill this or remove it";
                    } else if (value.isEmpty || value.isNum) {
                      return "You must fill this or remove it";
                    }
                  },
                  onSaved: (newValue) {
                    controller.ingredientlist[index] = newValue.toString();
                  },
                  onChanged: (value) {
                    controller.ingredientlist[index] = value.toString();
                  },
                ),
              ),
              Visibility(
                child: SizedBox(
                  width: 25,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    splashRadius: 25,
                    onPressed: () {
                      controller.addEmptyIngredient(index);
                    },
                  ),
                ),
                visible: index == controller.ingredientlist.length - 1,
              ),
              SizedBox(
                width: 5,
              ),
              Visibility(
                child: SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                    padding: EdgeInsets.only(right: 3),
                    splashRadius: 25,
                    splashColor: Colors.red,
                    onPressed: () {
                      controller.removeIngredientatIndex(index);
                    },
                  ),
                ),
                visible: index > 0,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
