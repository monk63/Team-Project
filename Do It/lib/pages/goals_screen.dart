import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:week_9/Component/goal_button.dart';
import 'package:week_9/pages/add_task.dart';
import 'package:week_9/pages/add_Goal.dart';
import 'package:week_9/pages/viewALLGoal.dart';


class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: const TextSpan(text: "Hello User", style: TextStyle(color: Colors.black, fontSize: 60, fontWeight: FontWeight.bold), children: [
                  TextSpan(text: "\nAdd A goal to your Day", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))
                ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const AddGoal(), transition: Transition.zoom, duration: const Duration(microseconds: 500));
                  },
                  child: const GoalButton(backgroundcolor: Colors.lightBlueAccent, text: "Add Goal", textColor: Colors.white),
                ),
                const SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ViewGoals(), transition: Transition.fade, duration: Duration(seconds: 1));
                  },
                  child: const GoalButton(backgroundcolor: Colors.white, text: "View All Goals", textColor: Colors.black),
                )
              ],
            ),
            decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/homeScreen.jpg")))));
  }
}
