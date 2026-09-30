import 'package:flutter/material.dart';
import 'package:flutter_apps/data/pokemon_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nama Pokemon")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset("assets/bulbasaur.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(20),

              color: Colors.black12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bulbasaur",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.3),
                    borderRadius: BorderRadiusGeometry.circular(999),
                    border: Border.all(
                      width: 1,
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text("Water"),
                ),
                Text(
                  "Base Power : 55",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Deskipsi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10.0),
                Text(dataPokemon[0].description, // mengambil deskipsi dari data pokemon
                  textAlign: TextAlign.justify,
                  style: TextStyle(),
                ),
                SizedBox(height: 10.0),
                Text("Skills",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star_border),
                      SizedBox(width: 10,),
                      Text("Water Bom"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
