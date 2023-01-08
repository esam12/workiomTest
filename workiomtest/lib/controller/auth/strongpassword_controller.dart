import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/data/datasource/remote/auth/signup.dart';

abstract class StrongPasswordController extends GetxController {
  signUp();
}

class StrongPasswordControllerImp extends StrongPasswordController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  late TextEditingController email, passwordtext;
  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signupdata = SignUpData(Get.find());
  List data = [];
  bool isShowPass = true;
  var password = ''.obs;
  var passwordStrength = 0.0.obs;
  //RegExp numRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Z].*");

  @override
  signUp() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //var response = await signupdata.postData(email.text, passwordtext.text);
      // statusRequest = handlingData(response);
      Get.offNamed(AppRoute.signUp_companyName,
          arguments: {"email": email.text});
      // if (StatusRequest.success == statusRequest) {
      //   if (response['status'] == "success") {

      //   } else {
      //     Get.defaultDialog(
      //         title: "Waring", middleText: "Email already Exists");
      //     statusRequest = StatusRequest.failure;
      //   }
      // }
      update();
    } else {}
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  void checkPasswordStregth(String value) {
    password.value = value.trim();
    if (password.value.isEmpty) {
      passwordStrength.value = 0.0;
    } else if (password.value.length > 0 && password.value.length <= 6) {
      passwordStrength.value = 2;
    } else if (password.value.length < 7) {
      passwordStrength.value = 1 / 3;
    } else {
      if (!letterRegExpress.hasMatch(password.value)
          //||
          //!numRegExpress.hasMatch(password.value)
          ) {
        passwordStrength.value = 2 / 3;
      } else {
        passwordStrength.value = 1;
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    passwordtext = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    passwordtext.dispose();
    super.dispose();
  }
}
