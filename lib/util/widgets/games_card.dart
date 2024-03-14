import 'package:flutter/material.dart';

class gameCard extends StatelessWidget {
  final String fecha;
  final String lugar;
  final String horario;
  final String score_1;
  final String score_2;
  final String team_1;
  final String team_2;

  gameCard(
      {required this.fecha,
      required this.lugar,
      required this.horario,
      required this.score_1,
      required this.score_2,
      required this.team_1,
      required this.team_2});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 83, 119, 119),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 37, 36, 36).withOpacity(0.6),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(team_1),
                Text(score_1),
                Text(team_2),
                Text(score_2 as String),
              ],
            ),
            Text(
              lugar,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              fecha,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
