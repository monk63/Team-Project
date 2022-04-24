// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';
import 'description.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String uid = '';
  @override
  void initState() {
    getuid();
    super.initState();
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    setState(
      () {
        uid = user.uid;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        backgroundColor: Color.fromARGB(255, 219, 110, 20), // appbar color.
        foregroundColor: Colors.black, // appbar text color.
        automaticallyImplyLeading: false,
      ),
      body: Container(
         color: Color.fromARGB(255, 199, 122, 59),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          
          stream: FirebaseFirestore.instance
              .collection('tasks')
              .doc(uid)
              .collection('mytasks')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<DocumentSnapshot> docs =
                  snapshot.hasData ? snapshot.data!.docs : [];

              return ListView.builder(
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      docs.elementAt(index).data() as Map<String, dynamic>;
                  var time = DateTime.parse(data["time"]);

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            title: docs[index]['title'],
                            description: docs[index]['description'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 72, 106, 165),
                          borderRadius: BorderRadius.circular(10)),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(docs[index]['title'],
                                      style: GoogleFonts.roboto(fontSize: 20))),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(
                                      DateFormat.yMd().add_jm().format(time)))
                            ],
                          ),

                          //Edit Task
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 120, bottom: 0, right: 0, top: 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => addTask(
                                        title: docs[index]['title'],
                                        description: docs[index]['description'],
                                        time: docs[index]['time'],
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                          ),

                          //Delete Task
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, bottom: 0, right: 0, top: 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                ),
                                onPressed: () async {
                                  //call delete

                                  // set up the buttons
                                  Widget cancelButton = FlatButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                    },
                                  );
                                  Widget continueButton = FlatButton(
                                    child:
                                        const Text("Yes, Delete Task Forever"),
                                    onPressed: () async {
                                      await docs[index].reference.delete();
                                      setState(() {});
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                      Fluttertoast.showToast(
                                          msg: "Task Deleted",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Color.fromARGB(255, 95, 55, 43),
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                  );

                                  // set up the AlertDialog
                                  AlertDialog alert = AlertDialog(
                                    title: const Text(
                                        "Confirm Permanent Deletion"),
                                    content: const Text(
                                        "You are about to perform an action that cannot be undone..."),
                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );
                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Color.fromARGB(255, 14, 17, 189)),
        backgroundColor: Color.fromARGB(255, 196, 104, 29),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addTask()));
        },
      ),
    );
  }
}
