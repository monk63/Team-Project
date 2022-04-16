import 'package:flutter/material.dart';
import 'package:week_9/pages/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
   ////
  //    body: SingleChildScrollView(
  //      child:  Column(
  //        children: <Widget>[
  //          FutureBuilder(
  //           future: Provider.of(context.auth.getCurrentUID()),
  //            builder: (context, snapshot){
  //              if (snapshot.connectionState == ConnectionState.done){
  //                return displayUserInformation(context, snapshot);
  //              }else{
  //                return CircularProgressIndicator();
  //              }
  //            },

  //          ),
  //        ],
       
  //    ),
  //    ),
  //   );
  // }

  //  Widget displayUserInformation(context, snapshot) {
  //   final user = snapshot.data;

  //   return Column(
  //     children: <Widget>[
  //       // Padding(
  //       //   padding: const EdgeInsets.all(8.0),
  //       //   child: Text(
  //       //     "Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
  //       // ),

  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
  //       ),

  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text("Created: ${DateFormat('MM/dd/yyyy').format(
  //             user.metadata.creationTime)}", style: TextStyle(fontSize: 20),),
  //       ),

  //       //showSignOut(context, user.isAnonymous),
  //     ],
    );
  }




}
