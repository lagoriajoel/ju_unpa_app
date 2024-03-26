import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/clasificationPage.dart';

import 'package:ju_unpa_app/pages/fixturePage.dart';
import 'package:ju_unpa_app/util/widgets/drawer_widget.dart';

// ignore: must_be_immutable
class programsPage extends StatelessWidget {
  int idSport;
  String nameSport;
  String categoriaSport;
  programsPage(this.idSport, this.nameSport, this.categoriaSport, {super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: drawerWidget(),
        body: Stack(
          children: [
            Container(
              height: size.height * .11,
              decoration: const BoxDecoration(
                color: Color.fromARGB(220, 39, 90, 90),
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage("assets/images/baner02.png"),
                    opacity: 0.8,
                    scale: 5.0),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Builder(
                          builder: (context) => IconButton(
                                icon: const Icon(
                                  Icons.clear_all,
                                  color: Colors.white,
                                  size: 34,
                                ),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                              )),
                      const Text(
                        "PROGRAMACIÓN",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: AutofillHints.birthday,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text("$nameSport $categoriaSport",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: SafeArea(
                          child: Column(
                        children: [
                          const TabBar(labelColor: Colors.black, tabs: [
                            Tab(
                              text: 'Fixture',
                            ),
                            Tab(
                              text: 'Clasificación',
                            ),
                          ]),
                          Expanded(
                              child: TabBarView(children: [
                            fixturePage(idSport),
                            clasificationPage(idSport)
                          ]))
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
