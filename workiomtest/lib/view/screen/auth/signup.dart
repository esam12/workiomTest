import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/controller/auth/signup_controller.dart';

import 'package:workiomtest/core/constant/color.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/view/widget/auth/signup/dropdown.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';
import 'package:workiomtest/view/widget/auth/signup/header.dart';
import 'package:workiomtest/view/widget/auth/signup/signwithgoogle.dart';
import 'package:workiomtest/view/widget/auth/signup/toolbar.dart';
import 'package:workiomtest/view/widget/auth/signup/enter_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Toolbar(
              text: "Sign in",
              onPressed: () {},
            ),
            const SizedBox(height: 30.12),
            const Header(text: "Create your free account"),
            const SizedBox(
              height: 137,
            ),
            Column(
              children: [
                const SignWithGoogle(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: const Text(
                    "Or",
                    style: TextStyle(color: AppColor.textcolor),
                  ),
                ),
                EnterButton(
                    text: "Continue with Email",
                    onPressed: () {
                      controller.goToStrongPassword();
                    },
                    color: AppColor.primarycolor),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 62),
                  child: const Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'By signing up, you agree ',
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.textcolor,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w300),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColor.textcolor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                              text: ' And ',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColor.textcolor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Rubik-Light",
                                      color: AppColor.textcolor,
                                      decoration: TextDecoration.underline),
                                )
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 161),
            const DropDown(),
            const SizedBox(
              height: 19.5,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
