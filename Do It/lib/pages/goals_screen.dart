
import 'package:flutter/material.dart';



class GoalsPage extends StatefulWidget {
  const GoalsPage({ Key? key }) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton( 
        height: 40.0, 
        minWidth: 400.0, 
      color: Theme.of(context).primaryColor, 
      textColor: Colors.white, 
      child: new Text("Create New Goal"), 
      onPressed: () => {}, 
      splashColor: Colors.redAccent,
    );
    
  }
}