import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/intro_page.dart';

class rulesPage extends StatefulWidget {
  const rulesPage({super.key});

  @override
  State<rulesPage> createState() => _rulesPageState();
}

class _rulesPageState extends State<rulesPage> {
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
      body: ListView(
        children: [
          buildImageInteractionCard(),
        ],
      ),
    );
  }

  Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Stack(
                children: [
                  Ink.image(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    height: 150,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                  ),
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 55, 118, 118),
                alignment: AlignmentDirectional.bottomStart,
                child: const Column(
                  children: [
                    Text(
                      ' VOLLEY',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(249, 250, 250, 1)),
                    ),
                    Text('Masculino',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                            fontSize: 20))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
