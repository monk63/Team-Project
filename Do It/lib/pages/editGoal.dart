import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditGoal extends StatefulWidget {
  const EditGoal({Key? key}) : super(key: key);

  @override
  _EditGoalState createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  @override
  Widget build(BuildContext context) {
    //define the argument
    final getMyData = ModalRoute.of(context)!.settings.arguments as UpdateGoal;

    //declare the text controller
    TextEditingController GoalName = TextEditingController(text: getMyData.GoalName);
    TextEditingController GoalDescription = TextEditingController(text: getMyData.GoalDescription);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update a Goal'),
        ),
        body: Column(
          children: <Widget>[
            const Text('Update a Goal'),
            TextField(
              controller: GoalName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'update Name',
              ),
            ),
            TextField(
              controller: GoalDescription,
              maxLength: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'update Number',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/update.php');
                var response = await http.post(url, body: {

                  'GoalName': GoalName.text,
                  'GoalDescription': GoalDescription.text
                });

                Navigator.pushNamed(context, '/');
              },
              child: const Text('Update Goal'),
            )
          ],
        ));
  }
}

class UpdateGoal {

  final String GoalName;
  final String GoalDescription;

  UpdateGoal(this.GoalName, this.GoalDescription);
}
