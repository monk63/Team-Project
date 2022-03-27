import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'pages/Login_Screen.dart';
import 'pages/splash.dart';
import '../Component/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';

//source: https://github.com/dragneel2074/login_logout_app/blob/master/lib/Screens/Home_Screen.dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
     create: (context) => GoogleSignInProvider(),
     child:  MaterialApp(
       debugShowCheckedModeBanner: false,
      home: SplashScreen(),
     ),
     );
    
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //  home: SplashScreen(),
   
    // );
  
}
