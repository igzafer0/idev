import 'package:flutter/material.dart';
import 'package:idev/core/base/state/base_state.dart';
import 'package:idev/view/authenticate/view_test/viewModel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_view.dart';

class ViewTest extends StatefulWidget {
  const ViewTest({super.key});

  @override
  State<ViewTest> createState() => _ViewTestState();
}

class _ViewTestState extends BaseState<ViewTest> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  Widget get textNumber {
    return Center(
      child: Observer(
        builder: (context) => Text(
          style: Theme.of(context).textTheme.titleLarge,
          viewModel.number.toString(),
        ),
      ),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.changeTheme(),
    );
  }
}
