import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage(
  'https://cdn.dribbble.com/users/3209228/screenshots/6018663/flat_profile_dribble.png'),
            radius: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Phone Number",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                  border: OutlineInputBorder()),
              obscureText: false,
              maxLines: 1),
          ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: const TextField(
                decoration: InputDecoration(
                hintText: "Enter your Address",
                labelText: "Address",
                labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                border: OutlineInputBorder()),
                obscureText: false,
                maxLines: 1,
          ),
              ),


        ]),
      ),
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
            _profileTitle = 'Home';
          }
          break;
        case 1:
          {
            _profileTitle = 'Service';
          }
          break;
        case 2:
          {
            _profileTitle = 'Confirm';
          }
          break;
        case 3:
          {
            _profileTitle = 'Profile';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_profileTitle)
        ,
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
            icon: Icon(Icons.whatshot),
            label: 'Menu',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Service',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Testimony ',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }


}
