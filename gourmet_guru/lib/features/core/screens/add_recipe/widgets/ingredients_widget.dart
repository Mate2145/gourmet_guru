import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../constants/colors.dart';
import '../../../controllers/add_recipe_controller.dart';
import '../../../models/units.dart';

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
                  validator: (value) {
                    if(value == null){
                       return "You must fill this or delete it";
                    }
                    else if(value.isEmpty || value.isNum){
                      return "You must fill this or delete it";
                    }
                  },
                  onSaved: (newValue) {
                    controller.ingredients[index].name = newValue.toString();
                  },
                  onChanged: (value) {
                    controller.ingredients[index].name = value.toString();
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
                  validator: (value) {
                    if(value == null){
                      return "You must fill this.";
                    }
                    else if( value.isNotEmpty)
                    {
                      if(int.parse(value) <= 0){
                          return "The amount cant be 0";
                      }
                      
                    }
                  },
                  onSaved: (newValue) {
                    controller.ingredients[index].amount = newValue as num;
                  },
                  onChanged: (value) {
                    if(value != null || value.isNotEmpty){
                      controller.ingredients[index].amount = int.parse(value);
                    }
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
                      controller.selectedUnit.value = unit!;
                      controller.ingredients[index].unit = controller.selectedUnit.value.name;
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