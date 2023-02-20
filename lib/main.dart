import 'package:flutter/material.dart';
import 'package:idev/view/authenticate/view_test/view/view_test.dart';

void main() {
  runApp(const IdevRun());
}

class IdevRun extends StatelessWidget {
  const IdevRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ViewTest();
  }
}
