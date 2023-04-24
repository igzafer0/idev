// ignore_for_file: file_names

import 'package:idev/core/base/model/base_model.dart';

import '../../constants/enum/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
