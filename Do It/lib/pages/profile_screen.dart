import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_9/pages/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appdar
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          )
        ],
      ),

         body: Container(
           decoration: const BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [Color.fromARGB(255, 160, 45, 10), Color.fromARGB(255, 26, 22, 23)],
             ),
           ),
           child: SizedBox(
             width: double.maxFinite,
            height: double.maxFinite,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children:  [
                 CircleAvatar(
                   backgroundImage: AssetImage("assets/images/profile.png"),
                   radius: 70.0,
                 ),
                 SizedBox(
                   height: 10.0,
                 ),
                  Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Email: ${_auth.currentUser!.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
        ),

        Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Created: ${DateFormat('MM/dd/yyyy').format(
             _auth.currentUser!.metadata.creationTime!)}", style: TextStyle(fontSize: 20),),
        ),

    
           
                 
               ],
             ),
           ),
         ),

    //  body: SingleChildScrollView(
    //    child: Column(
    //   children: <Widget>[
        
    //      Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Text("Email: ${_auth.currentUser!.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
    //     ),

    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Text("Created: ${DateFormat('MM/dd/yyyy').format(
    //           _auth.currentUser!.metadata.creationTime!)}", style: TextStyle(fontSize: 20),),
    //     ),

        
    //   ],
    // ),
    //  ),
    );
  }
}
