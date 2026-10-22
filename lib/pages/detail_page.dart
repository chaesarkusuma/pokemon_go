import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final String type;
  final bool isFavorite;

  const DetailPage({super.key, required this.pokemon, required this.type, required this.isFavorite});

  Color _typeColor() {
    if (type.contains('Water')) return Colors.blue;
    if (type.contains('Poison')) return Colors.purple;
    if (type.contains('Grass')) return Colors.green;
    if (type.contains('Electric')) return Colors.amber;
    if (type.contains('Dragon')) return Colors.indigo;
    if (type.contains('Fire')) return Colors.red;
    if (type.contains('Ice')) return Colors.teal;
    if (type.contains('Normal')) return Colors.grey;
    if (type.contains('Fighting')) return Colors.orange;
    return Colors.amber;
  }

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final CarouselSliderController _controller = CarouselSliderController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name,
          style: TextStyle(
            fontFamily: 'Pokemon',
            fontWeight: FontWeight.w900,
            fontSize: 32,
          ),
        ),
        backgroundColor: widget._typeColor().withOpacity(0.2),
        actions: [Icon(Icons.favorite_border_rounded), SizedBox(width: 15)],
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Row(
              children: [
                // Expanded Image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: widget.pokemon.name,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(40),
                        child: Image.asset(
                          widget.pokemon.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Expanded Profile
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pokemon.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 15),
                          TypeChip(type: widget.pokemon.type),
                          SizedBox(height: 15),
                          Text(
                            'Base Power: ${widget.pokemon.basePower}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            widget.pokemon.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 15),
                          // SKILLS
                          Text(
                            'Skill',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          // LIST SKILLS
                          Row(
                            children: [
                              Wrap(
                                children: widget.pokemon.skills
                                    .map(
                                      (e) => Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                      ),
                                      border: Border.all(
                                        color: widget._typeColor(),
                                        width: 2,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star),
                                        SizedBox(width: 5),
                                        Text(e),
                                      ],
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          // SLIDER MOVIES
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

                          Row(children: []),
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Base Power: ${widget.pokemon.basePower}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.pokemon.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Skill',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          children: widget.pokemon.skills
                              .map(
                                (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star),
                                    SizedBox(width: 5),
                                    Text(e),
                                  ],
                                ),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          child: CarouselSlider(
                            items: widget.pokemon.movies.map((toElement) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadiusGeometry.circular(25),
                                      child: Image.network(
                                        toElement,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.pokemon.movies.asMap().entries.map((
                              entry,
                              ) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                  (Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withValues(
                                    alpha: _current == entry.key
                                        ? 0.9
                                        : 0.4,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
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
      // body:
    );
  }
}