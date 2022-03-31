// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:week_9/pages/goals_screen.dart';
// import 'package:week_9/pages/reminders_screen.dart';
// import 'package:week_9/pages/settings_page.dart';
// import 'package:week_9/pages/tasks_screen.dart';
// import 'package:week_9/pages/public_screen.dart';



// class sec extends StatefulWidget {
//   @override
//   _secState createState() => _secState();
// }


// class _secState extends State<sec> {
//   final int _selectedIndex = 0;
//   final String _profileTitle="";
  
//   List pages = [
//     const GoalsPage(),
//     const TasksPage(),
//     const RemindersPage(),
//     const PublicPage(),
    
//   ];
//   int currentIndex=0;
//    void onTap(int index){
//      setState(() {
//        currentIndex =index;
//      });
     

//    }


// //Navigation bar
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_profileTitle),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         actions: _selectedIndex==3?  [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context)=> SettingsPage() ),
//               );
//             },
//           )
//         ]:[],
//       ),
//       body: pages[currentIndex],
        
//       bottomNavigationBar: BottomNavigationBar(

//         type: BottomNavigationBarType.fixed,
//         iconSize: 30,
//         selectedFontSize: 0 ,
//         unselectedFontSize: 0,
//         elevation: 0,
//         showUnselectedLabels: false,

//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sports_soccer),
//             label: 'Goals',

//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.task),
//             label: 'Tasks',

//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.remember_me),
//             label: 'Reminder ',

//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.public),
//             label: 'Public',

//           ),
//         ],
       
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// _signOut() async {
//   await _firebaseAuth.signOut();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           //Login message
//           children: [
//             Text('You have logged in Successfuly'),
//             SizedBox(height: 50),
//             Container(
//               height: 60,
//               width: 150,

          
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }