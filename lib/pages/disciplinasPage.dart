//import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ju_unpa_app/models/sport.dart';
import 'package:ju_unpa_app/util/widgets/drawer_widget.dart';
import 'package:ju_unpa_app/util/widgets/sport_card.dart';
import 'package:ju_unpa_app/service/sportService.dart';

class disciplinasPage extends StatefulWidget {
  disciplinasPage({super.key});

  @override
  State<disciplinasPage> createState() => _disciplinasPageState();
}

class _disciplinasPageState extends State<disciplinasPage> {
  List<dynamic> disciplinas = [];

  List<sport> sports = [];
  bool _isLoading = true;

  Future<void> getSports() async {
    sports = await sportService.getSportList();
    setState(() {
      _isLoading = false;
    });

    print(sports);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    getSports();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
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
                    scale: 3.0),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        "DEPORTES",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: AutofillHints.birthday,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        mainAxisExtent: 160),
                                itemCount: sports.length,
                                itemBuilder: (context, index) {
                                  return sportCard(
                                      id: sports[index].id,
                                      nombre: sports[index].name,
                                      categoria: sports[index].category,
                                      image: sports[index].image);
                                }),
                          ),
                  )
                ],
              ),
            ))
          ],
        )

        //
        );
  }
}
