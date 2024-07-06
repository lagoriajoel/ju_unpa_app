import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ju_unpa_app/pages/calendar_screen.dart';
import 'package:ju_unpa_app/pages/disciplinasPage.dart';
import 'package:ju_unpa_app/pages/info_page.dart';
import 'package:ju_unpa_app/pages/ubications_screen.dart';
import 'package:ju_unpa_app/util/widgets/category_cards.dart';
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
            height: size.height * .40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(220, 39, 90, 90),
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/logo04.png"),
                  opacity: 0.8,
                  scale: 1.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Builder(
                          builder: (context) => IconButton(
                                icon: const Icon(
                                  Icons.clear_all_rounded,
                                  color: Colors.white,
                                  size: 34,
                                ),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                              )),
                      const Center(
                        child: Text(
                          "JUEGOS UNIVERSITARIOS",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: AutofillHints.birthday,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 280,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .95,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: <Widget>[
                        categoryCard(
                            title: "Torneos",
                            page: disciplinasPage(),
                            svgSrc: "assets/icons/trophy.svg"),
                        categoryCard(
                            title: "Ubicaciones",
                            page: UbicationScreen(),
                            svgSrc: "assets/icons/location.svg"),
                        const categoryCard(
                            title: "Información",
                            page: infoPage(),
                            svgSrc: "assets/icons/info.svg"),
                        categoryCard(
                            title: "Calendario",
                            page: calendarScreen(),
                            svgSrc: "assets/icons/calendar.svg"),
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
