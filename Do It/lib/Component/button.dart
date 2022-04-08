import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class LoginSignupButton extends StatelessWidget {
  final String title;
  final dynamic  ontapp;

  LoginSignupButton({required this.title, required this.ontapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: 
            ontapp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20,color: Colors.red,),
              
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(115, 30, 16, 223)),
          ),
        ),
      ),
    );
  }
}