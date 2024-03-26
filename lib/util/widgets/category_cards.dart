import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            color: Colors.white60,
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 17,
                  //spreadRadius: -1,
                  color: Color.fromARGB(220, 115, 191, 177))
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
