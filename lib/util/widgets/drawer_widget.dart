import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/home_page.dart';
import 'package:ju_unpa_app/pages/info_page.dart';
import 'package:ju_unpa_app/pages/maps_screen.dart';
import 'package:ju_unpa_app/pages/ubications_screen.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(241, 5, 76, 77),
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/logo123.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),

          //divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            child: Divider(
              color: Colors.white,
              height: 10,
              thickness: 1.5,
            ),
          ),
          //pages
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: const Text(
                  'HOME',
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
                  'TORNEOS',
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
                Icons.map,
                color: Colors.white,
              ),
              title: const Text(
                'UBICACIONES',
              ),
              textColor: Colors.white70,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UbicationScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: const Text(
                'INFORMACIÓN',
              ),
              textColor: Colors.white70,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => infoPage()));
              },
            ),
          )
        ],
      ),
      //paginas
    );
  }
}
