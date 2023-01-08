import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/controller/auth/createworkspace_controller.dart';
import 'package:workiomtest/core/constant/color.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/core/functions/validinput.dart';
import 'package:workiomtest/view/widget/auth/signup/enter_button.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';
import 'package:workiomtest/view/widget/auth/signup/header.dart';
import 'package:workiomtest/view/widget/auth/signup/textfiled_companypage.dart';
import 'package:workiomtest/view/widget/auth/signup/toolbar.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateWorkSpaceImp());
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<CreateWorkSpaceImp>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: controller.fromstate,
            child: Column(
              children: [
                Toolbar(
                  text: "",
                  onPressed: () {
                    Get.offNamed(AppRoute.signUp_strongPassword);
                  },
                ),
                const SizedBox(height: 30.12),
                const Header(text: "Enter your company name"),
                const SizedBox(height: 80),
                TextFiledCompany(
                    mycontroller: controller.tenantname,
                    valid: (val) {
                      return validinput(val!, 5, 100, "tenantname");
                    },
                    text: "Your company or team name",
                    hint: "Workspace name*",
                    icon: Icons.groups,
                    type: TextInputType.text,
                    suffixtext: ".workiom.com"),
                const SizedBox(height: 24),
                TextFiledCompany(
                  mycontroller: controller.firsname,
                  text: "Your first name",
                  hint: "Enter your name",
                  icon: Icons.menu,
                  type: TextInputType.text,
                  suffixtext: "",
                  valid: (val) {
                    return validinput(val!, 3, 100, "text");
                  },
                ),
                const SizedBox(height: 24),
                TextFiledCompany(
                  mycontroller: controller.lastname,
                  text: "Your last name",
                  hint: "Enter your name",
                  icon: Icons.menu,
                  type: TextInputType.text,
                  suffixtext: "",
                  valid: (val) {
                    return validinput(val!, 3, 100, "text");
                  },
                ),
                const SizedBox(height: 28),
                EnterButton(
                    text: "Create Workspace",
                    onPressed: () {
                      controller.registerTenant();
                    },
                    color: AppColor.enterbuttonsecondcolor),
                const SizedBox(height: 139.5),
                const Footer()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
