import 'package:flutter/material.dart';
import 'package:ju_unpa_app/util/widgets/drawer_widget.dart';

class infoPage extends StatelessWidget {
  const infoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: drawerWidget(),
        body: Stack(
          children: [
            Container(
              height: size.height * .25,
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
                        "Información",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: AutofillHints.birthday,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 500,
                        child: Center(
                          child: Text(
                              "Luego de 2 años signados por la pandemia, la Universidad Nacional de la Patagonia Austral anunció que durante los días 27 y 28 de agosto volverán a realizarse los tradicionales Juegos UNPA, que en su XIV Edición tendrán como sede a la ciudad de Río Turbio y reunirán a estudiantes de las cuatro Unidades Académicas de nuestra casa de altos estudios.Este evento, que constituye en uno de los más importantes del deporte universitario de la región Patagónica, permitirá que más de 180 estudiantes deportistas de nuestra institución vuelvan a encontrarse a través de la práctica deportiva, en esta ocasión en las disciplinas Basquetbol masculino, Futsal femenino, Voleibol masculino, Ajedrez, Voleibol Femenino, Tenis de mesa y Futsal masculino.Desde la Coordinación de Deportes, el Prof. Mariano Nieto indicó que “hay un gran entusiasmo por parte de los y las estudiantes ante el regreso de este espacio que les permite encontrar en su Universidad no solo la posibilidad de llevar adelante su formación académica, sino también la práctica y formación deportiva”.Por su parte, la directora general de Bienestar Universitario, Prof. Claudia Ferreyra, manifestó que “desde la organización se ha trabajado a la par con las autoridades y gestión de la Unidad Académica Río Turbio, con la Secretaria de Hacienda y con las Áreas de Deportes y las Direcciones de Acceso y Permanencia de todas las Unidades Académicas” y agradeció especialmente “el compromiso asumido por la Municipalidad de Río Turbio”."),
                        )),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
