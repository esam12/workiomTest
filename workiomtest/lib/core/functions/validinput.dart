import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == "tenantname") {
    if (!GetUtils.isUsername(val)) {
      return "not valid tenantname";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "text") {
    if (!GetUtils.isUsername(val)) {
      return "not valid text";
    }
  }

  if (val.length < min) {
    return "value can't be less than $min";
  }

  if (val.length > max) {
    return "value can't be larger than $max";
  }

  if (val.isEmpty) {
    return "val can't be empty";
  }
}
