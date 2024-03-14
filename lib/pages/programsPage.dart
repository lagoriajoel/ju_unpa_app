import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/clasificationPage.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/fixturePage.dart';
import 'package:ju_unpa_app/pages/intro_page.dart';

// ignore: must_be_immutable
class programsPage extends StatelessWidget {
  int idSport;
  programsPage(this.idSport, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'Reglamentos',
                ),
                textColor: Colors.white70,
              ),
            )
          ],
        ),
        //paginas
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Column(
          children: [
            TabBar(labelColor: Colors.black, tabs: [
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
    );
  }
}
