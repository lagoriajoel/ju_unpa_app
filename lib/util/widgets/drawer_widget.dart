import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/home_page.dart';
import 'package:ju_unpa_app/pages/info_page.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          builder: (context) => const HomePage()));
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
