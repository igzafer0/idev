import 'package:flutter/material.dart';
import 'package:idev/core/extensions/context_extension.dart';
import 'package:idev/view/authenticate/register/viewModel/register_view_model.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  late RegisterViewModel viewModel;

  Scaffold get scaffoldBody {
    return Scaffold(
      body: SafeArea(child: bodyWidgetSkeleton),
    );
  }

  Container get bodyWidgetSkeleton {
    return Container(
      margin: context.marginHigh,
      child: Column(
        children: [
          const Spacer(),
          sloganText,
          const Spacer(),
        ],
      ),
    );
  }

  Text get sloganText => Text(
        "Dünyada Olup Biteni Gör",
        style: Theme.of(context).textTheme.titleLarge,
      );

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }
}
