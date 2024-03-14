import 'package:flutter/material.dart';

import 'package:ju_unpa_app/util/widgets/games_card.dart';
import 'package:ju_unpa_app/models/game.dart';

class fechaCard extends StatelessWidget {
  final String description;
  final List<game> games;

  fechaCard({
    required this.description,
    required this.games,
  });
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
            Text(
              description.toUpperCase(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return gameCard(
                    lugar: games[index].lugar,
                    horario: games[index].horario,
                    fecha: games[index].fecha,
                    score_1: games[index].score_1,
                    score_2: games[index].score_2,
                    team_1: games[index].team_1,
                    team_2: games[index].team_2,
                  );
                })
          ],
        ),
      ),
    );
  }
}
