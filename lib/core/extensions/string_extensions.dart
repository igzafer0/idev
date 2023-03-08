import 'package:idev/core/constants/app/app_constants.dart';

extension StringExtensions on String {
  String? get isEmailValid =>
      contains(RegExp(ApplicationConstants.EMAIL_REGIEX)) ? null : "";
}
