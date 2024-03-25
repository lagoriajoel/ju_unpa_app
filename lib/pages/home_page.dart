import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/info_page.dart';
import 'package:ju_unpa_app/pages/ubications_screen.dart';
import 'package:ju_unpa_app/util/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void navigate() {}
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: drawerWidget(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color.fromARGB(220, 39, 90, 90),
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage("assets/images/logo3.png"),
                  opacity: 0.8,
                  scale: 5.0),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Builder(
                      builder: (context) => IconButton(
                            icon: const Icon(
                              Icons.clear_all_rounded,
                              color: Colors.white,
                              size: 34,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          )),
                  const Text(
                    "JUEGOS UNIVERSITARIOS",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: AutofillHints.birthday,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "UNPA",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: AutofillHints.birthday,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 230,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .95,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: <Widget>[
                        categoryCard(
                            title: "Deporte",
                            page: disciplinasPage(),
                            svgSrc: "assets/icons/sports.svg"),
                        categoryCard(
                            title: "Ubicaciones",
                            page: UbicationScreen(),
                            svgSrc: "assets/icons/location.svg"),
                        categoryCard(
                            title: "Información",
                            page: infoPage(),
                            svgSrc: "assets/icons/info.svg"),
                        categoryCard(
                            title: "Torneos",
                            page: disciplinasPage(),
                            svgSrc: "assets/icons/trophy.svg"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonNavigate extends StatelessWidget {
  final String title;
  final String iconSvg;
  final Function function;
  final bool isActive;
  const ButtonNavigate({
    super.key,
    required this.title,
    required this.iconSvg,
    required this.function,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            iconSvg,
            color: isActive ? Colors.amberAccent : Colors.black87,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.amberAccent : Colors.black87),
          )
        ],
      ),
    );
  }
}

class categoryCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  final Widget page;
  const categoryCard({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: Container(
        padding: const EdgeInsets.all(0.8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 245, 244),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -18,
                  color: Color.fromARGB(220, 59, 171, 151))
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    svgSrc,
                    height: 50,
                    width: 60,
                  ),
                  const Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
