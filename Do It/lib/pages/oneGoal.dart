import 'package:flutter/material.dart';

class ViewAGoal extends StatefulWidget {
  const ViewAGoal({Key? key}) : super(key: key);

  @override
  _ViewAGoalState createState() => _ViewAGoalState();
}

class _ViewAGoalState extends State<ViewAGoal> {
  @override
  Widget build(BuildContext context) {
    //define the argument
    final clickedGoal = ModalRoute.of(context)!.settings.arguments as OneGoal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('View a Goal'),
      ),
      body: Center(
        child: ListTile(
          leading: const Icon(Icons.sports_soccer),
          title: Text(clickedGoal.goalName),
          subtitle: Text(clickedGoal.goalDescription),
        ),
      ),
    );
    // return Text(GoalToView.goalName + GoalToView.goalDescription);
  }
}

class OneGoal {
  final String goalName;
  final String goalDescription;

  OneGoal(this.goalName, this.goalDescription);
}
