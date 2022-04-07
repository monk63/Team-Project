import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';
import 'description.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({ Key? key }) : super(key: key);

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
    setState(() {
      uid = user.uid;
    },);
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(
      title: Text('Tasks'),
    automaticallyImplyLeading: false,
    //  actions: [
    //       IconButton(
    //           icon: Icon(Icons.logout),
    //           onPressed: () async {
    //             await FirebaseAuth.instance.signOut();
    //           }),
    //     ],
   ),
 body: Container(
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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {

               List<DocumentSnapshot> docs = snapshot.hasData ? snapshot.data!.docs: [];

              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String,dynamic> data = docs.elementAt(index).data() as Map<String,dynamic>;
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
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 43, 85, 163),
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
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(docs[index]['title'],
                                        style:
                                            GoogleFonts.roboto(fontSize: 20))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                        DateFormat.yMd().add_jm().format(time)))
                              ],
                              ),
                              
                              //Edit Task
                            Container( 
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
                                    time:docs[index]['time'],
                                    
                                  ),
                              ),
                                     );setState((){});                                        
                                  },
                                  ),
                                  ),                          
                                                            
                              //Delete Task
                          Container( 
                              child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                  onPressed: () async {
                                  //  FirebaseFirestore firestore = FirebaseFirestore.instance;
                                    await docs[index].reference.delete();
                                        setState((){});
                                        
                                  },
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
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => addTask()));
              },
            ),
    );
  }
}