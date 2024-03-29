import 'package:certify_me_kiosk/api/response/response_data_qrcode.dart';

class ValidateQrCodeResponse {
  final int responseCode;
  final int responseSubCode;
  final String? responseMessage;
  final ResponseDataQrCode? responseData;

  const ValidateQrCodeResponse(
      {required this.responseCode,
      required this.responseSubCode,
      required this.responseMessage,
      required this.responseData});

  factory ValidateQrCodeResponse.fromJson(Map<String, dynamic> json) {
    return ValidateQrCodeResponse(
        responseCode: json['responseCode'],
        responseSubCode: json['responseSubCode'],
        responseMessage: json['responseMessage'] ?? "Invalid QR Code",
        responseData:
        ResponseDataQrCode.fromJson(json['responseData'] == null ? const ResponseDataQrCode(id: "", firstName: "", lastName: "", middleName: "", memberId: "", accessId: ""
            "", trqStatus: 0, memberTypeId: 0, faceTemplate: "", memberTypeName: "", isVisitor: 0, scheduleId: 0,eventName: "", fromDate: "", toDate: "",documentType: 0) : json['responseData']));
  }
}