import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: pokemon.name,
          child: Image.asset(
            pokemon.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}