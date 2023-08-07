class CertificateModel {
  int? id;
  String? certificateIssuerInterMediateCAName;
  String? certificateExpirationDate;
  String? issuedCertificateDate;
  String? selectProduceName;
  String? certificateSerialCode;
  String? certificateValidityPeriod;

  CertificateModel({
    this.id,
    this.certificateIssuerInterMediateCAName,
    this.certificateExpirationDate,
    this.issuedCertificateDate,
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
      "issuedCertificateDate": issuedCertificateDate,
      "selectProduceName": selectProduceName,
      "certificateSerialCode": certificateSerialCode,
      "certificateValidityPeriod": certificateValidityPeriod
    };
  }

  factory CertificateModel.fromJson(Map<String, dynamic> parsedJson) {
    return CertificateModel(
        id: parsedJson['id'],
        certificateIssuerInterMediateCAName: parsedJson['certificateIssuerInterMediateCAName'],
        certificateExpirationDate: parsedJson['certificateExpirationDate'],
        issuedCertificateDate: parsedJson['issuedCertificateDate'],
        selectProduceName: parsedJson['selectProduceName'],
        certificateSerialCode: parsedJson["certificateSerialCode"],
        certificateValidityPeriod: parsedJson["certificateValidityPeriod"]
    );
  }
}
