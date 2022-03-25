import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Component/button.dart';
import '../constants.dart';
import 'goals_screen.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formkey,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: SingleChildScrollView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter Email";
                                }
                              },
                              textAlign: TextAlign.center,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter Password";
                                }
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              textAlign: TextAlign.center,
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  )),
                            ),
                            SizedBox(height: 80),
                            LoginSignupButton(
                              title: 'Login',
                              ontapp: () async {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    isloading = true;
                                  });
                                  try {
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);

                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (contex) => HomeScreen(),
                                      ),
                                    );

                                    setState(() {
                                      isloading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text("Ops! Login Failed"),
                                        content: Text('${e.message}'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text('Okay'),
                                          )
                                        ],
                                      ),
                                    );
                                    print(e);
                                  }
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Don't have an Account ?",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  SizedBox(width: 10),
                                  Hero(
                                    tag: '1',
                                                                      child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'goals_screen.dart';
// import 'signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => StartState();
// }

// class StartState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return initWidget();
//   }

//   initWidget() {
//     var container = Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(left: 20, right: 20, top: 70),
//             padding: EdgeInsets.only(left: 20, right: 20),
//             height: 54,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight),
//               borderRadius: BorderRadius.circular(50),
//               color: Colors.grey[200],
//               boxShadow: [
//                 BoxShadow(
//                     offset: Offset(0, 10),
//                     blurRadius: 50,
//                     color: Color(0xffEEEEEE)),
//               ],
//             ),
//             child: Text(
//               "LOGIN",
//               style: TextStyle(color: Colors.white),
//             ),
           
//         );
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Column(
//       children: [
//         Container(
//           height: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
//             color: new Color(0xffF5591F),
//             gradient: LinearGradient(
//               colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 50),
//                 child: Image.asset(
//                   "assets/images/splash.png",
//                   height: 90,
//                   width: 90,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 20, top: 20),
//                 alignment: Alignment.bottomRight,
//                 child: Text(
//                   "Login",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               )
//             ],
//           )),
//         ),
//         Container(
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(left: 20, right: 20, top: 70),
//           padding: EdgeInsets.only(left: 20, right: 20),
//           height: 54,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: Colors.grey[200],
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(0, 10),
//                   blurRadius: 50,
//                   color: Color(0xffEEEEEE)),
//             ],
//           ),
//           child: TextField(
//             cursorColor: Color(0xffF5591F),
//             decoration: InputDecoration(
//               icon: Icon(
//                 Icons.email,
//                 color: Color(0xffF5591F),
//               ),
//               hintText: "Enter Email",
//               enabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//           padding: EdgeInsets.only(left: 20, right: 20),
//           height: 54,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: Color(0xffEEEEEE),
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(0, 20),
//                   blurRadius: 100,
//                   color: Color(0xffEEEEEE)),
//             ],
//           ),
//           child: TextField(
//             cursorColor: Color(0xffF5591F),
//             decoration: InputDecoration(
//               focusColor: Color(0xffF5591F),
//               icon: Icon(
//                 Icons.vpn_key,
//                 color: Color(0xffF5591F),
//               ),
//               hintText: "Enter Password",
//               enabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//           alignment: Alignment.centerRight,
//           child: GestureDetector(
//             onTap: () {
//               // Write Click Listener Code Here
//             },
//             child: Text("Forget Password?"),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//               onPressed: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context)=> sec() ),
//               );
            
//             // Write Click Listener Code Here.
//           };
//           },
//           child: container,),
//         Container(
//           margin: EdgeInsets.only(top: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Don't Have Any Account?  "),
//               GestureDetector(
//                 child: Text(
//                   "Register Now",
//                   style: TextStyle(color: Color(0xffF5591F)),
//                 ),
//                 onTap: () {
//                   // Write Tap Code Here.
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SignUpScreen(),
//                       ));
//                 },
//               )
//             ],
//           ),
//         )
//       ],
//     )));
//   }
// }
