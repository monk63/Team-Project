import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_9/Component/goalTextfield.dart';
import 'package:week_9/Component/goal_button.dart';
import 'package:get/get.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController goal_nameController = TextEditingController();
    TextEditingController goal_descriptionController = TextEditingController();

    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/GoalAdd.jpg"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.lightBlueAccent))
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: goal_nameController,
                    hintText: "Type Goal Name",
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textController: goal_descriptionController,
                    hintText: "Describe your goal",
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GoalButton(backgroundcolor: Colors.lightBlueAccent, text: "Add Goal", textColor: Colors.black12)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              )
            ],
          )),
    );
  }
}
