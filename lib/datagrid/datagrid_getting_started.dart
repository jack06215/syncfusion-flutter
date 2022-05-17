import 'package:flutter/material.dart';
import 'package:syncfusion_flutter/model/sample_view.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'team_datagridsource.dart';

/// Render getting started data grid
class GettingStartedDataGrid extends SampleView {
  /// Creates getting started data grid
  const GettingStartedDataGrid({Key? key}) : super(key: key);

  @override
  _GettingStartedDataGridState createState() => _GettingStartedDataGridState();
}

class _GettingStartedDataGridState extends SampleViewState {
  /// DataGridSource required for SfDataGrid to obtain the row data.
  TeamDataGridSource teamDataGridSource = TeamDataGridSource();

  late bool isWebOrDesktop;

  SfDataGrid _buildDataGridForMobile() {
    return SfDataGrid(
      allowSorting: true,
      source: teamDataGridSource,
      columnWidthMode: ColumnWidthMode.fill,
      rowHeight: 50,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'image',
          width: 51,
          label: const SizedBox.shrink(),
        ),
        GridColumn(
          columnName: 'team',
          width: !isWebOrDesktop ? 90 : double.nan,
          label: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Team'),
          ),
        ),
        GridColumn(
          columnName: 'wins',
          label: const Center(
            child: Text('W'),
          ),
        ),
        GridColumn(
            columnName: 'losses',
            label: const Center(
              child: Text('L'),
            )),
        GridColumn(columnName: 'pct', label: const Center(child: Text('WPCT'))),
        GridColumn(
          columnName: 'gb',
          label: const Center(child: Text('GB')),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    isWebOrDesktop = model.isWeb || model.isDesktop;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDataGridForMobile();
  }
}
