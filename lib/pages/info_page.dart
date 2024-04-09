import 'package:flutter/material.dart';
import 'package:ju_unpa_app/models/info.dart';
import 'package:ju_unpa_app/service/infoService.dart';
import 'package:ju_unpa_app/util/widgets/drawer_widget.dart';
import 'package:ju_unpa_app/util/widgets/info_card.dart';

class infoPage extends StatefulWidget {
  const infoPage({super.key});

  @override
  State<infoPage> createState() => _infoPageState();
}
//List<dynamic> information = [];

class _infoPageState extends State<infoPage> {
  List<info> information = [];
  bool _isLoading = true;

  Future<void> getInformation() async {
    information = await infoService.getInfoList();

    setState(() {
      _isLoading = false;
    });

    print(information);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    getInformation();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                    scale: 1.5),
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
                        "INFORMACIÓN",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: AutofillHints.birthday,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        mainAxisExtent: 160),
                                itemCount: information.length,
                                itemBuilder: (context, index) {
                                  return infoCard(
                                    id: information[index].id,
                                    title_info: information[index].title_info,
                                    body_info: information[index].body_info,
                                  );
                                }),
                          ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
