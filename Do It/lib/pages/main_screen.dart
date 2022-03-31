

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_9/pages/goals_screen.dart';
import 'package:week_9/pages/reminders_screen.dart';
import 'package:week_9/pages/settings_page.dart';
import 'package:week_9/pages/tasks_screen.dart';
import 'package:week_9/pages/public_screen.dart';



class sec extends StatefulWidget {
  @override
  _secState createState() => _secState();
}

 


class _secState extends State<sec> {
  final int _selectedIndex = 0;
  final String _profileTitle="";
  
  List pages = [
    const GoalsPage(),
    const TasksPage(),
    const RemindersPage(),
    const PublicPage(),
    
  ];
  int currentIndex=0;
   void onTap(int index){
     setState(() {
       currentIndex =index;
     });
     

   }


//Navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_profileTitle),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: _selectedIndex==3?  [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> SettingsPage() ),
              );
            },
          )
        ]:[],
      ),
      body: pages[currentIndex],
        
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 0 ,
        unselectedFontSize: 0,
        elevation: 0,
        showUnselectedLabels: false,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Goals',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remember_me),
            label: 'Reminder ',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Public',

          ),
        ],
       
      ),
    );
  }
}
