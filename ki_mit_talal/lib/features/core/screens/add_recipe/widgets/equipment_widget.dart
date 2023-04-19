import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/core/controllers/add_recipe_controller.dart';

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
                  validator: (value) {
                    if (value == null) {
                      return "You must fill this or remove it";
                    } else if (value.isEmpty || value.isNum) {
                      return "You must fill this or remove it";
                    }
                  },
                  onSaved: (newValue) {
                    controller.equipment[index].name = newValue.toString();
                  },
                  onChanged: (value) {
                    controller.equipment[index].name = value.toString();             
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
                    controller.addEmptyEquipment();
                  },),
                ),
                visible: index == controller.equipment.length - 1,
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
                      controller.removeEquipmentatIndex(index);
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