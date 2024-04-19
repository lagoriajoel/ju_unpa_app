import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendarScreen extends StatelessWidget {
  calendarScreen({super.key});
  bool backButtonVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(241, 5, 76, 77),
        elevation: 0,
        leading: backButtonVisible
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      body: Column(
        children: [
          Center(
              child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now()))
        ],
      ),
    );
  }
}
