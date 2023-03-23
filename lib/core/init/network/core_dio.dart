import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:idev/core/base/model/base_error.dart';
import 'package:idev/core/constants/enum/http_request_enum.dart';
import 'package:idev/core/extensions/network_extension.dart';
import 'package:idev/core/init/network/ICoreDio.dart';

import '../../base/model/base_model.dart';
import 'IResponseModel.dart';
part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = HttpClientAdapter();
  }
  @override
  final BaseOptions options;

  @override
  Future<IResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await request<dynamic>(
        path,
        data: data,
        options: Options(
          method: type.rawValue,
        ),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<R, T>(parseModel, response.data);

          return ResponseModel<R>(data: model);
        default:
          return ResponseModel(error: BaseError('message'));
      }
    } catch (ex) {
      return ResponseModel(error: BaseError(ex.toString()));
    }
  }
}
