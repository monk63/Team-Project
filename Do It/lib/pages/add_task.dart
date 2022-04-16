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
    
    //super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content: const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  
  }
  @override  
    Widget build(BuildContext context) {
      AwesomeNotifications().initialize(
      'resource://drawable/splash',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          defaultColor: Color.fromARGB(255, 202, 112, 9),
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: '',
        ),
      ],
    );
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
                    onPressed: ()async {
                      if (widget.title != null && widget.description != null){
                        
                      editTask();
                      } else {

                        addtasktofirebase();
                        await AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 10,
                channelKey: 'basic_channel',
                title: 'Do It',
                body: 'Your task has been created successfully'));
                        
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