
import 'package:flutter/material.dart';
import 'package:week_9/pages/settings_page.dart';


class GoalsPage extends StatefulWidget {
  const GoalsPage({ Key? key }) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: Text('Goals'),
  automaticallyImplyLeading: false,

  ),

    
    body: MaterialButton( 
        height: 40.0, 
        minWidth: 400.0, 
      color: Theme.of(context).primaryColor, 
      textColor: Colors.white, 
      child: new Text("Create New Goal"), 
      onPressed: () => {}, 
      splashColor: Colors.redAccent,
    ));
    
  }
}


