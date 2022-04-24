import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'goals_screen.dart';



class addGoal extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add A Goal"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Type Goal Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Describe This Goal',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                ref
                    .push()
                    .set(
                      title.text,
                    )
                    .asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => GoalsPage()));
              },
              child: Text(
                "Add Goal!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//   }
//     Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: 
//       Text('New Goal'),
//       automaticallyImplyLeading: false,

//   ),
//         body: SingleChildScrollView(
          
//           child: Center(
//           child: Column(
//             children: <Widget>[

//               const Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text('Fill All Information in Form', 
//                        style: TextStyle(fontSize: 22))),

//               Container(
//               width: 280,
//               padding: EdgeInsets.all(10.0),
//               child: TextField(
//                   controller: goal_nameController,
//                   autocorrect: true,
//                   decoration: InputDecoration(hintText: 'Enter Goal Here'),
//                 )
//               ),
 
//               Container(
//               width: 280,
//               padding: EdgeInsets.all(10.0),
//               child: TextField(
//                   controller: goal_descriptionController,
//                   autocorrect: true,
//                   decoration: InputDecoration(hintText: 'Enter goal description Here'),
//                 )
//               ),
 
            
//               RaisedButton(
//                 onPressed: webCall,
//                 color: Colors.pink,
//                 textColor: Colors.white,
//                 padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
//                 child: Text('Click Here To Submit Data To Server'),
//               ),

//               Visibility(
//                 visible: visible, 
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 30),
//                   child: CircularProgressIndicator()
//                   )
//                 ),

//             ],
//           ),
//         )));
//   }


// }