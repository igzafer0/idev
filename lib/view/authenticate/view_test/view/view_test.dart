import 'package:flutter/material.dart';
import 'package:idev/core/base/state/base_state.dart';
import 'package:idev/core/base/view/base_view.dart';

class ViewTest extends StatefulWidget {
  const ViewTest({super.key});

  @override
  State<ViewTest> createState() => _ViewTestState();
}

class _ViewTestState extends BaseState<ViewTest> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, viewModel) => const Text(
        "data",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}