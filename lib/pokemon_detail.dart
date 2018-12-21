import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokeDetail(this.pokemon);

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        top: MediaQuery.of(context).size.height * 0.11,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 110,
              ),
              Text(pokemon.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                        .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                ),
                Text("Weakness"),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(t,
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {}))
                        .toList(),
                ),
                Text("Next Evolution"),
                pokemon.nextEvolution!=null?
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  pokemon.nextEvolution 
                        .map((n) => FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(n.name,
                            style: TextStyle(color: Colors.white),),
                            onSelected: (b) {}))
                        .toList() ,
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("No more Evolution",style: TextStyle(color: Colors.lightBlue,fontStyle: FontStyle.italic,),)
                  ],
                )
            ],
          ),
        ),
      ),

      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img,child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pokemon.img))
            ),
          )
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),

      body: bodyWidget(context),

    );
  }
}