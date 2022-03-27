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
            Text('You have logged in Successfuly'),
            SizedBox(height: 50),
            Container(
              height: 60,
              width: 150,

              //logout button
              child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Text('Log out'),
                  ),
                  onPressed: () async {
                    await _signOut();
                    if (_firebaseAuth.currentUser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
              ),
            ),
          ],
        ),
      ),
  
  );
  }
}