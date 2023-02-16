import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final Function(T viewModel)? onViewModelReady;
  final VoidCallback? onDispose;
  final Widget Function(BuildContext context, T value) onPageBuilder;

  const BaseView(
      {super.key,
      this.viewModel,
      this.onViewModelReady,
      this.onDispose,
      required this.onPageBuilder});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(widget.viewModel);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
