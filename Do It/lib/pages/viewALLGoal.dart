import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:week_9/Component/goal_button.dart';
import 'package:week_9/Component/goal_widget.dart';
import 'editGoal.dart';
import 'package:get/get.dart';

class ViewGoals extends StatefulWidget {
  const ViewGoals({Key? key}) : super(key: key);

  @override
  State<ViewGoals> createState() => _ViewGoalsState();
}

class _ViewGoalsState extends State<ViewGoals> {
  //declare the list array

  @override
  Widget build(BuildContext context) {
    List myData = [
      "try harder",
      "try again"
    ];

    List<String> recipients = [
      "0203595867",
      "0209535914"
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.grey.withOpacity(0.3),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/alltaskimg.jpg"))),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.sports_soccer,
                  color: Colors.black87,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5), color: Colors.black87),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month_sharp,
                  color: Colors.black87,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "3",
                  style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    onDismissed: (DismissDirection direction) {
                      print("After dismiss");
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 550,
                                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4), borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GoalButton(backgroundcolor: Colors.white30, text: "View Goals", textColor: Colors.black87),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GoalButton(backgroundcolor: Colors.white30, text: "Edit Goal", textColor: Colors.black87)
                                    ],
                                  ),
                                ),
                              );
                            });
                        return false;
                      } else {
                        return Future.delayed(Duration(seconds: 1), () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: GoalWidget(
                        text: myData[index],
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
//
//
// IconButton(
// onPressed: () {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// title: Text('Are you sure you want to share this goal via SMS?'),
// actions: <Widget>[
// FlatButton(
// child: Text('Yes'),
// //call the delete method
// onPressed: () {
// _sendSMS("Type the goal and description" , recipients);
//
// }),
// FlatButton(
// child: Text('No'),
// onPressed: () {
// getgoalMethod();
// Navigator.of(context).pop();
// }),
// ],
// );
// });
// },
// icon: Icon(Icons.share)),
//
//
//
//
//
//
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   getgoalMethod();
// }
//
// //write your own method to get all goals
// void getgoalMethod() async {
//   var url = Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/get_all_goals.php');
//   var response = await http.get(url);
//
//   setState(() {
//     allGoals = jsonDecode(response.body);
//   });
// }
//
//
//
// //write a method for delete
// void deletegoalMethod(goal_name,goal_description) async {
//   var url = Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/deleteapi.php');
//   var response = await http.post(url, body: {
//     'goal_name': goal_name, 'goal_description': goal_description
//   });
//
//   //to reset the list after delete
//   //call the get goal method
//   getgoalMethod();
// }
//
//
//
// void _sendSMS(String message,  List<String> recipients) async {
//
//   String _result = await sendSMS(message: message, recipients: recipients)
//       .catchError((onError){
//     print(onError);});
//   print(_result);
//
// }
//
//
//
//
//
//
//
//
