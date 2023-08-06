class CertificateModel {
  int? id;
  String? certificateIssuerInterMediateCA;
  String? certificateExpirationDate;
  String? issuedCertificateDate;
  String? selectProduceName;
  String? certificateSerialCode;

  CertificateModel({
    this.id,
    this.certificateIssuerInterMediateCA,
    this.certificateExpirationDate,
    this.issuedCertificateDate,
    this.selectProduceName,
    this.certificateSerialCode
  });

  static const String tableName = "my_table";

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "certificateIssuerInterMediateCA": certificateIssuerInterMediateCA,
      "certificateExpirationDate": certificateExpirationDate,
      "issuedCertificateDate": issuedCertificateDate,
      "selectProduceName": selectProduceName,
      "certificateSerialCode": certificateSerialCode
    };
  }

  factory CertificateModel.fromJson(Map<String, dynamic> parsedJson) {
    return CertificateModel(
        id: parsedJson['id'],
        certificateIssuerInterMediateCA: parsedJson['certificateIssuerInterMediateCA'],
        certificateExpirationDate: parsedJson['certificateExpirationDate'],
        issuedCertificateDate: parsedJson['issuedCertificateDate'],
        selectProduceName: parsedJson['selectProduceName'],
        certificateSerialCode: parsedJson["certificateSerialCode"]
    );
  }
}
