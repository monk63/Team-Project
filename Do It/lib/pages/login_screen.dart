import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Component/button.dart';
import '../constants.dart';
import 'main_screen.dart';
import 'signup_screen.dart';
import '../Component/google_sign_in.dart';
import 'package:week_9/pages/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return sec();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something is wrong!'));
            } else {
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 120),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child: Image.asset(
                                          "assets/images/splash.png",
                                          height: 90,
                                          width: 90,
                                        ),
                                      ),
                                      Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: Color.fromARGB(
                                                255, 42, 26, 190),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 30),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter Email";
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                          hintText: 'Email',
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Color.fromARGB(
                                                255, 34, 44, 141),
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
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                hintText: 'Password',
                                                prefixIcon: Icon(
                                                  Icons.lock,
                                                  color: Color.fromARGB(
                                                      255, 50, 27, 153),
                                                )),
                                      ),
                                      SizedBox(height: 80),

                                      LoginSignupButton(
                                        title: 'Login',
                                        ontapp: () async {
                                          if (formkey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isloading = true;
                                            });
                                            try {
                                              await _auth
                                                  .signInWithEmailAndPassword(
                                                      email: email,
                                                      password: password);

                                              setState(() {
                                                isloading = false;
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title:
                                                      Text("Ops! Login Failed"),
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
                                      //Google sign in

                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 34, 117, 185),
                                          onPrimary: Color.fromARGB(
                                              255, 238, 232, 232),
                                          maximumSize:
                                              Size(double.infinity, 50),
                                        ),
                                        icon: FaIcon(FontAwesomeIcons.google,
                                            color: Colors.red),
                                        label: Text('Sign Up with Google'),
                                        onPressed: () {
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);
                                          provider.googleLogin();
                                        },
                                      ),

                                      SizedBox(height: 30),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Don't have an Account ?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      221, 44, 53, 184)),
                                            ),
                                            SizedBox(width: 10),
                                            Hero(
                                              tag: '1',
                                              child: Text(
                                                'Sign up',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 182, 89, 3)),
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
          },
        ),
      );
}
