import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'editGoal.dart';

class ViewGoals extends StatefulWidget {
  const ViewGoals({Key? key}) : super(key: key);

  @override
  State<ViewGoals> createState() => _ViewGoalsState();
}



class _ViewGoalsState extends State<ViewGoals> {
  //declare the list array
  List allGoals = [];

  List <String> recipients = ["0203595867","0209535914"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allGoals.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(allGoals[index]['goal_name']),
          subtitle: Text(allGoals[index]['goal_description']),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Are you sure you want to share this goal via SMS?'),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('Yes'),
                                  //call the delete method
                                  onPressed: () {
                                    _sendSMS("Type the goal and description" , recipients);

                                  }),
                              FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    getgoalMethod();
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.share)),

              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/updateGoal', arguments:
                    UpdateGoal(allGoals[index]['goal_name'],
                        allGoals[index]['goal_description']));
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Are you sure you want to delete this goal?'),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('Yes'),
                                  //call the delete method
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    deletegoalMethod(allGoals[index]['goal_name'],
                                        allGoals[index]['goal_description']);
                                  }),
                              FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    getgoalMethod();
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getgoalMethod();
  }

  //write your own method to get all goals
  void getgoalMethod() async {
    var url = Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/get_all_goals.php');
    var response = await http.get(url);

    setState(() {
      allGoals = jsonDecode(response.body);
    });
  }



  //write a method for delete
  void deletegoalMethod(goal_name,goal_description) async {
    var url = Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/deleteapi.php');
    var response = await http.post(url, body: {
      'goal_name': goal_name, 'goal_description': goal_description
    });

    //to reset the list after delete
    //call the get goal method
    getgoalMethod();
  }



  void _sendSMS(String message,  List<String> recipients) async {

    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError){
      print(onError);});
    print(_result);

  }


}









