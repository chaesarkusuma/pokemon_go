import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name,
          style: TextStyle(
            fontFamily: 'PokemonSolid',
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Icon(Icons.favorite_border_rounded),
          SizedBox(width: 15)],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Hero(
                        tag: widget.pokemon.name,
                        child: Image.asset(
                          widget.pokemon.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pokemon.name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text(
                              widget.pokemon.type,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Base Power: ${widget.pokemon.basePower}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            widget.pokemon.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Skill',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: widget.pokemon.skills
                                .map(
                                  (e) => Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: Colors.amber,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          e,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 5),
                          //slider movie
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                            ),
                            itemCount: widget.pokemon.movies.length ~/ 2,
                            itemBuilder: (context, index, realIdx) {
                              final int first = index * 2;
                              final int second = first + 1;
                              return Row(
                                children: [first, second].map((idx) {
                                  return Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Image.network(
                                        widget.pokemon.movies[idx],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.pokemon.image),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 14,
                      end: 14,
                      top: 20,
                      bottom: 14,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 12,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pokemon.name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Text(
                            widget.pokemon.type,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Base Power: ${widget.pokemon.basePower}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.pokemon.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Skill',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.pokemon.skills
                              .map(
                                (e) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.black87,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        e,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 15),
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: true,
                          ),
                          items: widget.pokemon.movies
                              .map(
                                (url) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      //   body:
    );
  }
}
