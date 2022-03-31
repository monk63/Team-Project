
import 'package:flutter/material.dart';



class NewGoalPage extends StatefulWidget {
  const NewGoalPage({ Key? key }) : super(key: key);

  @override
  State<NewGoalPage> createState() => _NewGoalPageState();
}

class _NewGoalPageState extends State<NewGoalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: Text('New Goal'),
  automaticallyImplyLeading: false,

   ),
    );



}
}