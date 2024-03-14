import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/rulesPage.dart';

class intro_page extends StatelessWidget {
  const intro_page({super.key});

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
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
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
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Icon(
                    Icons.sports_handball,
                    color: Colors.white,
                  ),
                  title: Text(
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
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => rulesPage()));
                },
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
      body: Center(
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
              child: Image.asset(
                'lib/images/Logo2-UNPA.png',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //title
            const Text(
              'Juegos Universitarios UNPA',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey),
              textAlign: TextAlign.center,
            )
            //description
          ],
        ),
      ),
    );
  }
}
