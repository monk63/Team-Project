import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Component/button.dart';
import '../constants.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,size: 30,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                            Hero(
                              tag: '1',
                                                          child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                email = value.toString().trim();
                              },
                              validator: (value) => (value!.isEmpty)
                                  ? ' Please enter email'
                                  : null,
                              textAlign: TextAlign.center,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter Your Email',
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
                                  hintText: 'Choose a Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  )),
                            ),
                            SizedBox(height: 80),
                            LoginSignupButton(
                              title: 'Register',
                              ontapp: () async {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    isloading = true;
                                  });
                                  try {
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blueGrey,
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              'Sucessfully Register.You Can Login Now'),
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                    Navigator.of(context).pop();

                                    setState(() {
                                      isloading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title:
                                            Text(' Ops! Registration Failed'),
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
                                  }
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                              },
                            ),
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
// import 'package:week_9/pages/goals_screen.dart';


// class SignUpScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => InitState();
// }

// class InitState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) => initWidget();

//   Widget initWidget() {
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Column(
//       children: [
//         Container(
//           height: 250,
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
//                   "Register",
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
//                 Icons.person,
//                 color: Color(0xffF5591F),
//               ),
//               hintText: "Full Name",
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
//               hintText: "Email",
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
//                 Icons.phone,
//                 color: Color(0xffF5591F),
//               ),
//               hintText: "Phone Number",
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
//         GestureDetector(
//           onTap: () {
//             // Write Click Listener Code Here.
//           },
//           child: Container(
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
//               "REGISTER",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 10, bottom: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Have Already Member?  "),
//               ElevatedButton(
//               child: Text("Login Now"),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//                   ),              
//                   onPressed:() {
//                   Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context)=> sec() ),
//               );

//               },
//             )
                
                 
               
                 
                
              
//             ],
//           ),
//         )
//       ],
//     )));
//   }
// }
 