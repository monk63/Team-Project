import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/Login_Screen.dart';
import 'pages/splash.dart';

//source: https://github.com/dragneel2074/login_logout_app/blob/master/lib/Screens/Home_Screen.dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: SplashScreen(),
      home: LoginScreen(),
    );
  }
}
