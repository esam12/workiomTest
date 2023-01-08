class GetPasswordComplexitySetting {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  GetPasswordComplexitySetting(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  GetPasswordComplexitySetting.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  Setting? setting;

  Result({this.setting});

  Result.fromJson(Map<String, dynamic> json) {
    setting =
        json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }
}

class Setting {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  Setting(
      {this.requireDigit,
      this.requireLowercase,
      this.requireNonAlphanumeric,
      this.requireUppercase,
      this.requiredLength});

  Setting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['requireDigit'] = this.requireDigit;
    data['requireLowercase'] = this.requireLowercase;
    data['requireNonAlphanumeric'] = this.requireNonAlphanumeric;
    data['requireUppercase'] = this.requireUppercase;
    data['requiredLength'] = this.requiredLength;
    return data;
  }
}
