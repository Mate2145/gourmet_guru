import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/controllers/add_recipe_controller.dart';

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
                  validator: (value) {
                    if (value == null) {
                      return "You must fill this or remove it";
                    } else if (value.isEmpty || value.isNum) {
                      return "You must fill this or remove it";
                    }
                  },
                  onSaved: (newValue) {
                    controller.steps[index].step = newValue.toString();
                  },
                  onChanged: (value) {
                    controller.steps[index].step = value.toString();
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
                      controller.addEmtpyStep(index);
                    },
                  ),
                ),
                visible: index == controller.steps.length - 1,
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
                      controller.removeStepsatIndex(index);
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
