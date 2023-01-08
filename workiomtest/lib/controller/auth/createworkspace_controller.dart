import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/functions/handlingdata.dart';
import 'package:workiomtest/data/datasource/remote/auth/registertenant.dart';

abstract class CreateWorkSpace extends GetxController {
  registerTenant();
}

class CreateWorkSpaceImp extends CreateWorkSpace {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  RegExp validCharacters = RegExp(r'^[a-z0-9_\-=@,\.;]+$');
  late TextEditingController tenantname, firsname, lastname;
  StatusRequest statusRequest = StatusRequest.none;
  RegisterTenant registertenant = RegisterTenant(Get.find());

  @override
  registerTenant() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      setup(); // to get timezone

      var response = await registertenant.postData(tenantname.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['result']['tenantId'] != null) {
          Get.defaultDialog(
              title: "Success",
              middleText: "response you will get the tenantId");
        } else {
          Get.defaultDialog(
              title: "Waring", middleText: "Tenan Company Name invalid");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    tenantname = TextEditingController();
    firsname = TextEditingController();
    lastname = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    tenantname.dispose();
    firsname.dispose();
    lastname.dispose();
    super.dispose();
  }

  Future<void> setup() async {
    tz.initializeTimeZones();
    var istanbulTimeZone = tz.getLocation('Europe/Istanbul');
    var now = tz.TZDateTime.now(istanbulTimeZone);
  }
}
