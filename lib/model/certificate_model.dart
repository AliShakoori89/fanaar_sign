class CertificateModel {
  int? id;
  String? certificateIssuerInterMediateCA;
  String? certificateExpirationDate;
  String? certificateValidityPeriod;

  CertificateModel({
    this.id,
    this.certificateIssuerInterMediateCA,
    this.certificateExpirationDate,
    this.certificateValidityPeriod
  });

  static const String tableName = "my_table";

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "certificateIssuerInterMediateCA": certificateIssuerInterMediateCA,
      "certificateExpirationDate": certificateExpirationDate,
      "certificateValidityPeriod": certificateValidityPeriod
    };
  }

  factory CertificateModel.fromJson(Map<String, dynamic> parsedJson) {
    return CertificateModel(
        id: parsedJson['id'],
        certificateIssuerInterMediateCA: parsedJson['certificateIssuerInterMediateCA'],
        certificateExpirationDate: parsedJson['certificateExpirationDate'],
        certificateValidityPeriod: parsedJson['certificateValidityPeriod']
    );
  }
}
