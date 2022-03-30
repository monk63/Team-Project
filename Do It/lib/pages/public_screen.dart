
import 'package:flutter/material.dart';
import 'package:week_9/pages/settings_page.dart';



class PublicPage extends StatefulWidget {
  const PublicPage({ Key? key }) : super(key: key);

  @override
  State<PublicPage> createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: Text('Public'),
  automaticallyImplyLeading: false,
  actions: <Widget>[
    IconButton(
      icon: Icon(
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