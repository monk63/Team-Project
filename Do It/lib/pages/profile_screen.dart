
import 'package:flutter/material.dart';
import 'package:week_9/pages/settings_page.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: const Text('Profile'),
  automaticallyImplyLeading: false,
  actions: <Widget>[
    IconButton(
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> SettingsPage() ),
              );
            },
    )
  ],
));
}
}