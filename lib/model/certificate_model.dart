class CertificateModel{
  int? id;
  List<CertificateDetailsModel>? certificateDetails;

  CertificateModel({this.id, this.certificateDetails});

  factory CertificateModel.fromJson(Map<String, dynamic> json)
  => CertificateModel(
    id: json["\$id"],
    certificateDetails: List<CertificateDetailsModel>.from(json["certificateDetails"].map((x)
    => CertificateDetailsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\$id": id,
    "certificateDetails": List<dynamic>.from(certificateDetails!.map((x) => x.toJson())),
  };
}


class CertificateDetailsModel {
  int? id;
  String? certificateIssuerInterMediateCAName;
  String? certificateExpirationDate;
  String? certificateIssuedDate;
  String? selectProduceName;
  String? certificateSerialCode;
  String? certificateValidityPeriod;

  CertificateDetailsModel({
    this.id,
    this.certificateIssuerInterMediateCAName,
    this.certificateExpirationDate,
    this.certificateIssuedDate,
    this.selectProduceName,
    this.certificateSerialCode,
    this.certificateValidityPeriod
  });

  static const String tableName = "my_table";

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "certificateIssuerInterMediateCAName": certificateIssuerInterMediateCAName,
      "certificateExpirationDate": certificateExpirationDate,
      "issuedCertificateDate": certificateIssuedDate,
      "selectProduceName": selectProduceName,
      "certificateSerialCode": certificateSerialCode,
      "certificateValidityPeriod": certificateValidityPeriod
    };
  }

  factory CertificateDetailsModel.fromJson(Map<String, dynamic> parsedJson) {
    return CertificateDetailsModel(
        id: parsedJson['id'],
        certificateIssuerInterMediateCAName: parsedJson['certificateIssuerInterMediateCAName'],
        certificateExpirationDate: parsedJson['certificateExpirationDate'],
        certificateIssuedDate: parsedJson['issuedCertificateDate'],
        selectProduceName: parsedJson['selectProduceName'],
        certificateSerialCode: parsedJson["certificateSerialCode"],
        certificateValidityPeriod: parsedJson["certificateValidityPeriod"]
    );
  }
}
