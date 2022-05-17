/// Package import
import 'package:flutter/material.dart';

/// Local import
import 'model.dart';

/// Base class of the sample's stateful widget class
abstract class SampleView extends StatefulWidget {
  /// base class constructor of sample's stateful widget class
  const SampleView({Key? key}) : super(key: key);
}

/// Base class of the sample's state class
abstract class SampleViewState<T extends SampleView> extends State<T> {
  /// Holds the SampleModel information
  late SampleModel model;

  /// Holds the information of current page is card view or not
  late bool isCardView;

  @override
  void initState() {
    model = SampleModel.instance;
    isCardView = model.isCardView && !model.isWebFullView;
    super.initState();
  }

  /// Must call super.
  @override
  void dispose() {
    model.isCardView = true;
    super.dispose();
  }

  /// Get the settings panel content.
  Widget? buildSettings(BuildContext context) {
    return null;
  }
}
