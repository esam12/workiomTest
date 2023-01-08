import 'package:workiomtest/core/class/crud.dart';
import 'package:workiomtest/linkapi.dart';

class RegisterTenant {
  late Crud crud;

  RegisterTenant(this.crud);

  postData(String tenancyName) async {
    var response = await crud.postData(LinkApi.IsTenantAvailable, {
      "tenancyName": tenancyName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
