// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "register": "Register",
  "full_name": "Full Name",
  "phone": "Phone Number",
  "email": "Email",
  "password": "Password",
  "confirm_password": "Confirm Password",
  "submit": "Submit",
  "user_info": "User Info",
  "back": "Back",
  "name_error": "Please enter your name",
  "phone_error": "Enter a valid phone number",
  "email_error": "Enter a valid email",
  "password_error": "Password must be at least 6 characters",
  "password_mismatch": "Passwords do not match"
};
static const Map<String,dynamic> _ru = {
  "register": "Register",
  "full_name": "Full Name",
  "phone": "Phone Number",
  "email": "Email",
  "password": "Password",
  "confirm_password": "Confirm Password",
  "submit": "Submit",
  "user_info": "User Info",
  "back": "Back",
  "name_error": "Please enter your name",
  "phone_error": "Enter a valid phone number",
  "email_error": "Enter a valid email",
  "password_error": "Password must be at least 6 characters",
  "password_mismatch": "Passwords do not match"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ru": _ru};
}
