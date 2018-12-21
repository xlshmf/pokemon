import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Profile") ,
        ),
        body: Center(
          child: Column(
            
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              new Image.network("http://i2.hdslb.com/bfs/face/4b05f4026ceecd46e5839d788ca766816b4cde23.jpg"),
             new Container(
               padding: const EdgeInsets.all(40),
               child: new Text("Ash Ketchum, known as Satoshi (サトシ) in Japan, is a fictional character in the Pokémon franchise owned by Nintendo. He is the main protagonist of the Pokémon anime and certain manga series as well as on various merchandise related to the franchise.",
               style: new TextStyle(fontSize: 14),
               ),
             )
            ],
          )
    ),
      ),
    );
  }
}