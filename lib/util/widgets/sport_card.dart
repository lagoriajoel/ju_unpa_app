import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/programsPage.dart';

class sportCard extends StatelessWidget {
  final int id;
  final String nombre;
  final String categoria;
  final String image;

  const sportCard({
    super.key,
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => programsPage(id, nombre, categoria)))
        },
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(image),
                  height: 101,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.linearToSrgbGamma(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              color: Color.fromARGB(237, 17, 86, 76),
              alignment: AlignmentDirectional.bottomStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(249, 250, 250, 1)),
                  ),
                  Text(categoria,
                      style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                          fontSize: 15))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
