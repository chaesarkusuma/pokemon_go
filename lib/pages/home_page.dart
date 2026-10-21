import 'package:flutter/material.dart';
import 'package:flutter_apps/data/pokemon_data.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/widgets/pokemon_card.dart';
import 'package:flutter_apps/widgets/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pokemon> pokemon = dataPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon GO", style: TextStyle(fontFamily: 'Pokemon', fontSize: 32, color: Colors.amber),), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 425) {
                  return ListView.builder(
                    itemCount: pokemon.length,
                    itemBuilder: (context, index) {
                      return PokemonList(pokemon: pokemon[index]);
                    },
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: pokemon.length,
                    itemBuilder: (context, index) {
                      return PokemonCard(pokemon: pokemon[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}