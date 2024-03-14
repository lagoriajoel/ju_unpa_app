import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/programsPage.dart';

class sportCard extends StatelessWidget {
  final int id;
  final String nombre;
  final String categoria;
  final String image;

  sportCard({
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => programsPage(id)))
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
              padding: EdgeInsets.all(5.0),
              color: Color.fromARGB(255, 64, 139, 104),
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

// InkWell(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//         width: MediaQuery.of(context).size.width,
//         height: 90,
//         decoration: BoxDecoration(
//           color: const Color.fromRGBO(0, 97, 99, 1),
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 37, 36, 36).withOpacity(0.6),
//               blurRadius: 10.0,
//               spreadRadius: -6.0,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               nombre.toUpperCase(),
//               style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             Text(
//               categoria.toUpperCase(),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => programsPage(id)));
//       },
//     );