import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

import '../Component/google_sign_in.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}


class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  
    final user = FirebaseAuth.instance.currentUser!;
  
  
  return Scaffold(
    appBar: AppBar(
      title: Text('Settings')
  ),
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //Login message
          children: [
            // Text('You have logged in Successfuly'),
            // SizedBox(height: 50),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log out"),
              onTap: ()async{

                    await _signOut();
                    if (_firebaseAuth.currentUser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    }
              },
            ),
          ],
        ),
      ),
  
  );
  }
}