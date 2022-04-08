import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class addTask extends StatefulWidget {
  String? title;
  String? description;
  String? time;
addTask({ Key? key, this.title, this.description, this.time }) : super(key: key);
  @override
  State<addTask> createState() => _addTaskState();
}


class _addTaskState extends State<addTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  

  addtasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String uid = auth.currentUser!.uid;
    var time = DateTime.now();
    await firestore
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(time.toIso8601String())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toIso8601String(),
    });
 
    Fluttertoast.showToast(
        msg: "Task Has Been Created",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 44, 31, 167),
        textColor: Colors.white,
        fontSize: 16.0
    );    
  }  

  editTask() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String uid = auth.currentUser!.uid;
    var time = DateTime.now();
    await firestore
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(widget.time)
        .update({
      'title': titleController.text,
      'description': descriptionController.text,
    });
    //Notification
    //Fluttertoast.showToast(msg: 'Task Created');
    Fluttertoast.showToast(
        msg: "Task Has Been Edited",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 44, 31, 167),
        textColor: Colors.white,
        fontSize: 16.0
    );    
  }  


  @override
  void initState() {
    super.initState();
    if (widget.title != null && widget.description != null){
      titleController.text = widget.title!;
      descriptionController.text = widget.description!;
    }
  }

  @override  
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
      title: Text('New Task'),
    automaticallyImplyLeading: false,
   ),

    body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Enter Title', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Enter Description',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple.shade100;
                      return Theme.of(context).primaryColor;
                      },
                    ),
                  ),
                    child: Text(
                      'Add Task',
                      style: GoogleFonts.roboto(fontSize: 18),
                    ),
                    onPressed: () {
                      if (widget.title != null && widget.description != null){
                        
                      editTask();
                      } else {
                        addtasktofirebase();
                        
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
            ],
          ),
        ),
    );
  }
}