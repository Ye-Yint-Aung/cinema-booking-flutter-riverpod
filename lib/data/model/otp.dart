class OtpObject {
  bool? success;
  String? message;
  Data? data;

  OtpObject({this.success, this.message, this.data});

  OtpObject.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? oTP;

  Data({this.oTP});

  Data.fromJson(Map<String, dynamic> json) {
    oTP = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OTP'] = oTP;
    return data;
  }
}
