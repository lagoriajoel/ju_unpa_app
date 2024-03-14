//import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/intro_page.dart';

//import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/pages/rulesPage.dart';
import 'package:ju_unpa_app/models/sport.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Juegos UNPA',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(0, 97, 99, 1),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(0, 97, 99, 1),
        child: Column(
          children: [
            //logo
            DrawerHeader(
                child: Image.asset(
              'lib/images/logoUNPA.png',
              //color: Color.fromARGB(26, 0, 0, 0),
            )),

            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Divider(),
            ),
            //pages
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const intro_page()));
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                  ),
                  textColor: Colors.white70,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: const Icon(
                    Icons.sports_handball,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Disciplinas',
                  ),
                  textColor: Colors.white70,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => disciplinasPage()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text(
                  'Reglamentos',
                ),
                textColor: Colors.white70,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => rulesPage()));
                },
              ),
            )
          ],
        ),
        //paginas
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: sports.length,
              itemBuilder: (context, index) {
                return sportCard(
                    id: sports[index].id,
                    nombre: sports[index].nombre,
                    categoria: sports[index].categoria,
                    image: sports[index].image);
              }),
    );
  }
}
