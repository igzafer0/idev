import 'package:flutter/material.dart';
import 'package:idev/core/base/state/base_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:idev/core/constants/enum/app_theme_enum.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/view/base_view.dart';

import '../../../../core/init/notifier/theme_notifier.dart';
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

      return dataView;
    });
  }

  Widget get loadingWidget {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get dataView {
    return ListView.builder(
        itemCount: viewModel.data.length,
        itemBuilder: ((context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: customListTile(index, context));
        }));
  }

  ListTile customListTile(int index, BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5))),
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: listTileHeader(index),
      ),
      subtitle: Text(viewModel.data[index].body.toString()),
      textColor: context.watch<ThemeNotifier>().currentTheme.hintColor,
      tileColor: context.watch<ThemeNotifier>().currentTheme.primaryColor,
    );
  }

  Text listTileHeader(int index) {
    return Text(viewModel.data[index].title.toString(),
        style: const TextStyle(color: Colors.white));
  }

  SizedBox get floatingActionButtonNumberIncrement {
    bool isDark =
        context.watch<ThemeNotifier>().currenThemeEnum == AppThemes.LIGHT;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => viewModel.changeTheme(),
            child: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () => viewModel.getSampleRequest(),
          )
        ],
      ),
    );
  }
}
