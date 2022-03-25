import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_9/pages/settings_page.dart';



class sec extends StatefulWidget {
  @override
  _secState createState() => _secState();
}


class _secState extends State<sec> {
  int _selectedIndex = 0;
  String _profileTitle="";
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[


    const Text(
      'Home',
      style: optionStyle,
    ),

    const Text(
      'Service',
      style: optionStyle,
    ),
    const Text(
      'Testimonial',
      style: optionStyle,
    ),

    Container(
      
    ),
// Widget>[], Column

// Container

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _profileTitle = 'Goal';
          }
          break;
        case 1:
          {
            _profileTitle = 'Tasks';
          }
          break;
        case 2:
          {
            _profileTitle = 'Reminder';
          }
          break;
        case 3:
          {
            _profileTitle = 'Share';
          }
          break;
      }
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15 ,
        unselectedFontSize: 15,

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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }


}
