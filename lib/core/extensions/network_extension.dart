import '../constants/enum/http_request_enum.dart';

extension NetworkExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";
    }
  }
}
