/// Dart import
import 'dart:math' as math;

/// Packages import
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// DataGrid import
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:syncfusion_flutter/datagrid/model/team.dart';

/// Set team's data collection to data grid source.
class TeamDataGridSource extends DataGridSource {
  /// Creates the team data source class with required details.
  TeamDataGridSource() {
    _teams = _getTeams(_teamNames.length);
    buildDataGridRows();
  }

  List<Team> _teams = <Team>[];

  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  /// Building DataGridRows
  void buildDataGridRows() {
    _dataGridRows = _teams.map<DataGridRow>((Team team) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<Image>(columnName: 'image', value: team.image),
        DataGridCell<String>(columnName: 'team', value: team.team),
        DataGridCell<int>(columnName: 'wins', value: team.wins),
        DataGridCell<int>(columnName: 'losses', value: team.losses),
        DataGridCell<double>(columnName: 'pct', value: team.winPercentage),
        DataGridCell<double>(columnName: 'gb', value: team.gamesBehind),
      ]);
    }).toList();
  }

  // Overrides
  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: <Widget>[
      Container(
        padding: const EdgeInsets.all(8.0),
        child: row.getCells()[0].value,
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          row.getCells()[1].value.toString(),
          softWrap: true,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[5].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }

  // Team data's
  final List<String> _teamNames = <String>[
    'Denver',
    'Charllote',
    'Memphis',
    'New York',
    'Detroit',
    'L.A Lakers',
    'Miami',
    'Orlando',
    'L.A Clippers',
    'San Francisco',
    'Dallas',
    'Milwaukke',
    'Oklahoma',
    'Cleveland',
  ];

  final List<Image> _teamLogos = <Image>[
    Image.asset('images/DenverNuggets.png'),
    Image.asset('images/Hornets.png'),
    Image.asset('images/Memphis.png'),
    Image.asset('images/NewYork.png'),
    Image.asset('images/DetroitPistons.png'),
    Image.asset('images/LosAngeles.png'),
    Image.asset('images/Miami.png'),
    Image.asset('images/Orlando.png'),
    Image.asset('images/Clippers.png'),
    Image.asset('images/GoldenState.png'),
    Image.asset('images/Mavericks.png'),
    Image.asset('images/Milwakke.png'),
    Image.asset('images/Thunder_Logo.png'),
    Image.asset('images/Cavaliers.png'),
  ];

  final List<double> _gb = <double>[
    0,
    10,
    15.5,
    15.5,
    40.5,
    0,
    2,
    3,
    14.5,
    19,
    0,
    20,
    24.5,
    28.5,
    31,
    16.6,
    10.3
  ];
  final List<int> _wins = <int>[
    93,
    82,
    76,
    77,
    52,
    84,
    82,
    81,
    70,
    65,
    97,
    77,
    72,
    68,
    66,
    23,
    45
  ];
  final List<double> _pct = <double>[
    .616,
    .550,
    .514,
    .513,
    .347,
    .560,
    .547,
    .540,
    .464,
    .433,
    .642,
    .510,
    .480,
    .453,
    .437,
    .567,
    .345
  ];
  final List<int> _losses = <int>[
    58,
    67,
    72,
    73,
    98,
    66,
    68,
    69,
    81,
    85,
    54,
    74,
    78,
    82,
    85,
    68,
    78
  ];

  List<Team> _getTeams(int count) {
    final List<Team> teamData = <Team>[];
    for (int i = 0; i < count; i++) {
      teamData.add(Team(
        _teamNames[i],
        _pct[i],
        _gb[i],
        _wins[i],
        _losses[i],
        _teamLogos[i],
      ));
    }
    return teamData;
  }
}
