
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




class TransfterData extends StatefulWidget {

  TransfterDataWidget createState() => TransfterDataWidget();
  
  }
  class TransfterDataWidget extends State {
  // Getting value from TextField widget.
  final goal_nameController = TextEditingController();
  final goal_descriptionController = TextEditingController();
 

    // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  Future webCall() async{

    // Showing CircularProgressIndicator using State.
    setState(() {
     visible = true ; 
    });

    // Getting value from Controller
    String goal = goal_nameController.text;
    String description = goal_descriptionController.text;

    // API URL
    var url =Uri.parse('https://dicksonakubiaussd.000webhostapp.com/public_html/submit_data.php') ;

    // Store all data with Param Name.
    var data = {'goal': goal, 'description': description};

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
       visible = false; 
      });
    }

    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('New Goal'),
      automaticallyImplyLeading: false,

  ),
        body: SingleChildScrollView(
          
          child: Center(
          child: Column(
            children: <Widget>[

              const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Fill All Information in Form', 
                       style: TextStyle(fontSize: 22))),

              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: goal_nameController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Name Here'),
                )
              ),
 
              Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                  controller: goal_descriptionController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Email Here'),
                )
              ),
 
            
              RaisedButton(
                onPressed: webCall,
                color: Colors.pink,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text('Click Here To Submit Data To Server'),
              ),

              Visibility(
                visible: visible, 
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator()
                  )
                ),

            ],
          ),
        )));
  }


}