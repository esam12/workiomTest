import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/view/screen/auth/company_name.dart';
import 'package:workiomtest/view/screen/auth/signup.dart';
import 'package:workiomtest/view/screen/auth/strong_password.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Auth
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.signUp_strongPassword: (context) => const StrongPassword(),
  AppRoute.signUp_companyName: (context) => const CompanyName(),
};
