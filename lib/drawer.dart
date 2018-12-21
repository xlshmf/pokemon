import 'package:flutter/material.dart';
import 'package:pokemon/pages/profile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new ListView(
         children: <Widget>[
           new UserAccountsDrawerHeader(
             decoration: new BoxDecoration(color: Colors.cyan),
             onDetailsPressed: null,
             accountName: new Text('Ash Ketchum'),
             accountEmail: new Text('Ash@pokemon.com'),
             currentAccountPicture: new CircleAvatar(
               backgroundColor: Colors.black,
               backgroundImage: new NetworkImage("http://i2.hdslb.com/bfs/face/4b05f4026ceecd46e5839d788ca766816b4cde23.jpg"),
             ),
             otherAccountsPictures: <Widget>[
               new CircleAvatar(
                 backgroundImage: new NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544598979339&di=cf7650a64eff60b0b9fde74d226dc63d&imgtype=0&src=http%3A%2F%2Fwx3.sinaimg.cn%2Flarge%2F89b1f885ly1fg72jcmh05j20go0euk0w.jpg"),
               )
             ],
           ),
           new ListTile(
             title: new Text("Profile"),
             trailing: new Icon(Icons.account_circle),
             onTap: () => Navigator.of(context).push(
               new MaterialPageRoute(
                 builder: (BuildContext context) => 
                    new Profile()))
           ),
           new Divider(),
            new ListTile(
             title: new Text("Meaasge"),
             trailing: new Icon(Icons.comment),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Gallary"),
             trailing: new Icon(Icons.filter),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Store"),
             trailing: new Icon(Icons.store),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Back"),
             trailing: new Icon(Icons.arrow_forward),
             onTap: () => Navigator.of(context).pop(),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Settings"),
             trailing: new Icon(Icons.settings),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Sort"),
             trailing: new Icon(Icons.sort),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Near me"),
             trailing: new Icon(Icons.near_me),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Home Website"),
             trailing: new Icon(Icons.home),
           ),
           new Divider(),
            new ListTile(
             title: new Text("Exit"),
             trailing: new Icon(Icons.exit_to_app),
              
           ),

         ],
       ),
       
    );
  }
}