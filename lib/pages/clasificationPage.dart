import 'package:flutter/material.dart';
import 'package:ju_unpa_app/models/team.dart';
import 'package:ju_unpa_app/service/teamService.dart';

// ignore: must_be_immutable
class clasificationPage extends StatefulWidget {
  int id;
  clasificationPage(this.id, {super.key});

  @override
  State<clasificationPage> createState() => _clasificationPageState();
}

class _clasificationPageState extends State<clasificationPage> {
  List<team> equipos = [];
  // ignore: unused_field
  bool _isLoading = true;

  Future<void> getEquipos() async {
    final res = await teamService.getTeamOfSport(widget.id);
    if (res.error != null) {
      print(res.error! + "errrrrrr");
    } else {
      setState(() {
        _isLoading = false;
      });
      equipos = res.success;
      print(equipos);
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    getEquipos();
  }

  List<team> teamsList = [
    team(name: 'UACO', matchWon: 2, matchLost: 2, matchTied: 2, point: 6),
    team(name: 'UARG', matchWon: 2, matchLost: 2, matchTied: 2, point: 6),
    team(name: 'UASJ', matchWon: 2, matchLost: 2, matchTied: 2, point: 6),
    team(name: 'UART', matchWon: 2, matchLost: 2, matchTied: 2, point: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildDataTable(),
    );
  }

  final columns = ['Equipos', 'PG', 'PP', 'PE', 'Puntos'];
  Widget buildDataTable() {
    return DataTable(
      columnSpacing: (MediaQuery.of(context).size.width / 4) * 0.5,
      columns: getColumns(columns),
      rows: getRows(equipos),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String columns) => DataColumn(label: Text(columns)))
      .toList();

  List<DataRow> getRows(List<team> teams) => teams.map((team team) {
        final cells = [
          team.name,
          team.matchWon,
          team.matchLost,
          team.matchTied,
          team.point
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
