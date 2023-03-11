import 'package:flutter/material.dart';
import 'package:idev/core/base/state/base_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewModel/test_view_model.dart';

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
        body: showData,
      );

  Widget get showData {
    return Observer(builder: (context) {
      if (viewModel.isLoading) {
        return loadingWidget;
      }

      return textData;
    });
  }

  Widget get loadingWidget {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get textData {
    return Center(
      child: Text(
        style: Theme.of(context).textTheme.titleLarge,
        viewModel.data.toString(),
      ),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.getSampleRequest(),
    );
  }
}
