// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:idev/core/constants/enum/http_request_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}

  @observable
  int number = 0;

  @observable
  bool isLoading = false;

  @action
  void incrementNumber() {
    number++;
  }

  String data = "";

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;

    final response = await coreDio!.send<List<TestModel>, TestModel>('posts',
        type: HttpTypes.GET, parseModel: TestModel());

    isLoading = false;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(viewModelContext, listen: false).changeTheme();
  }
}
