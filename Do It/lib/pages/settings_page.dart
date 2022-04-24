import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Component/app_title.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Component/constants.dart';
import 'login_screen.dart';
import 'package:carbon_icons/carbon_icons.dart';
import '../Component/google_sign_in.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
      void _launchUrl(String _url) async {
      await canLaunch(_url)
          ? await launch(_url)
          : throw 'Could not launch $_url';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 196, 104, 29), // appbar color.
        foregroundColor: Colors.black, // appbar text color.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(
              height: 48,
            ),
              const SizedBox(
                height: 150,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/splash.png"),
                  radius: 70.0,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            const AppBarTitle(
              trailingTitle: 'Do It',
              fontSize: 36,
            ),
            const AppBarTitle(
              leadingTitle: 'by',
              fontSize: 16,
            ),
            const AppBarTitle(
              leadingTitle: 'MAD ',
              trailingTitle: 'Team 4',
              fontSize: 20,
            ),
            const SizedBox(
              height: 48,
            ),
            const Spacer(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _launchUrl(fbUrl),
                  icon: const Icon(
                    Icons.facebook,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () => _launchUrl(mailUrl),
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () => _launchUrl(githubUrl),
                  icon: const Icon(
                    Icons.code_off,
                    size: 32,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log out"),
              onTap: () async {
                await _signOut();
                if (_firebaseAuth.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
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
