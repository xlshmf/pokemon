import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pokemon.dart';
import 'pokemon_detail.dart';
import 'drawer.dart';

void main() => runApp(MaterialApp(
  title: "Poke App",
  theme: new ThemeData(primarySwatch: Colors.cyan),
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {                                                           //async 等待时间内不锁定用户操作
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub.toJson());
    setState(() {});                                                           //数据改变时重新加载
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("              Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null ?Center(child: CircularProgressIndicator(),): GridView.count(crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail(
                poke,
              )));
            },
            child: Hero(                                     //承载动画
              tag: poke.img,
              child: Card(
                elevation: 3,                                //使卡片“抬起”
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(poke.img))
                      ),
                    ),
                    Text(poke.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
        )).toList(),
      ),
      drawer: new Drawer(
        child: MyDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
