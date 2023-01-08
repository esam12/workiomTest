import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/core/constant/routes.dart';

abstract class SignupController extends GetxController {
  goToStrongPassword();
}

class SignupControllerImp extends SignupController {
  late TextEditingController email, password;

  bool isShowPass = true;

  @override
  goToStrongPassword() {
    Get.offNamed(AppRoute.signUp_strongPassword);
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }
}
