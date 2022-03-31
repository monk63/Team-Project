// // ignore_for_file: camel_case_types, unnecessary_import, unused_import

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

///k,nksn 


<<<<<<< HEAD
// class _secState extends State<sec> {
//   final int _selectedIndex = 0;
//   final String _profileTitle="";
=======
class _secState extends State<sec> {
 
>>>>>>> 887449487e4d74f1981cef8c4c4f74ac83113e0e
  
//   List pages = [
//     const GoalsPage(),
//     const TasksPage(),
//     const RemindersPage(),
//     const PublicPage(),
    
<<<<<<< HEAD
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
=======
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
      
      body: pages[currentIndex],
        
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
>>>>>>> 887449487e4d74f1981cef8c4c4f74ac83113e0e

//         type: BottomNavigationBarType.fixed,
//         iconSize: 30,
//         selectedFontSize: 0 ,
//         unselectedFontSize: 0,
//         elevation: 0,
//         showUnselectedLabels: false,

<<<<<<< HEAD
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sports_soccer),
//             label: 'Goals',
=======
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Goals',
>>>>>>> 887449487e4d74f1981cef8c4c4f74ac83113e0e

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
