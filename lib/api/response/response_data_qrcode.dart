class ResponseDataQrCode {
  final String id;
  final String firstName;
  final String lastName;
  final String memberId;
  final String accessId;
  final int trqStatus;
  final int memberTypeId;
  final String faceTemplate;
  final String memberTypeName;
  final int isVisitor;

  const ResponseDataQrCode(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.memberId,
      required this.accessId,
      required this.trqStatus,
      required this.memberTypeId,
      required this.faceTemplate,
      required this.memberTypeName,
      required this.isVisitor});

  factory ResponseDataQrCode.fromJson(Map<String, dynamic> json) {
    return ResponseDataQrCode(
        id: json['id'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        memberId: json['memberId'] ?? "",
        accessId: json['accessId'] ?? "",
        trqStatus: json['trqStatus'] ?? "",
        memberTypeId: json['memberTypeId'] ?? "",
        faceTemplate: json['faceTemplate'] ?? "",
        memberTypeName: json['memberTypeName'] ?? "",
        isVisitor: json['isVisitor'] ?? "");
  }
}