import 'package:flutter/material.dart';
import 'package:ju_unpa_app/service/fechaService.dart';

// ignore: must_be_immutable
class fixturePage extends StatefulWidget {
  int id;
  fixturePage(this.id, {super.key});

  @override
  State<fixturePage> createState() => _fixturePageState();
}

class _fixturePageState extends State<fixturePage> {
  List<dynamic> fechas = [];

  bool _isLoading = true;

  Future<void> getFecha() async {
    //fechas = await fechaService.getFechaList(widget.id);
    fechas = await fechaService.getFechaListApi(widget.id);

    setState(() {
      _isLoading = false;
    });

    print(fechas);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    getFecha();
  }

  Widget renderFechas() {
    return ListView(
      children: fechas
          .map(
            (item) => Column(children: [
              Container(
                  padding: EdgeInsets.all(8),
                  color: const Color.fromRGBO(0, 97, 99, 1),
                  height: 40,
                  width: double.infinity,
                  child: Text(item.description,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight
                              .bold))), //Mostrar el titulo principal aqui

              //Mostar items
              Column(
                  children: (item.games as List)
                      .map(
                        (game) =>
                            // titulo del item aqui

                            Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    game['team_1']['nombre'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(game['score_1'].toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    game['team_2']['nombre'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(game['score_2'].toString()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(game['lugar']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(game['fecha']),
                            ),
                            Text(game['horario']),
                          ],
                        ),
                      )
                      .toList())
            ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: renderFechas(),
                ),
              ));
  }
}
