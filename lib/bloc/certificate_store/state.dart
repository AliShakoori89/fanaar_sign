import 'package:equatable/equatable.dart';
import 'package:fanar_sign/model/certificate_model.dart';

enum CertificateStatus { initial, success, error, loading }

extension CertificateStatusStatusX on CertificateStatus {
  bool get isInitial => this == CertificateStatus.initial;
  bool get isSuccess => this == CertificateStatus.success;
  bool get isError => this == CertificateStatus.error;
  bool get isLoading => this == CertificateStatus.loading;
}

class CertificateState extends Equatable {

  const CertificateState({
    this.status = CertificateStatus.initial,
    String? certificateIssuerInterMediateCAName,
    String? certificateExpirationDate,
    String? certificateValidityPeriod,
    String? issuedCertificateDate,
    String? selectProduceName,
    List<CertificateDetailsModel>? storeCertificate,
  }):certificateIssuerInterMediateCAName = certificateIssuerInterMediateCAName ?? "",
        certificateExpirationDate = certificateExpirationDate ?? "",
        certificateValidityPeriod = certificateValidityPeriod ?? "",
        issuedCertificateDate = issuedCertificateDate ?? "",
        selectProduceName = selectProduceName ?? "",
        storeCertificate = storeCertificate ?? const [];
  final CertificateStatus status;
  final String certificateIssuerInterMediateCAName;
  final String certificateExpirationDate;
  final String certificateValidityPeriod;
  final String issuedCertificateDate;
  final String selectProduceName;
  final List<CertificateDetailsModel> storeCertificate;

  @override
  // TODO: implement props
  List<Object> get props => [status,
    certificateIssuerInterMediateCAName, certificateExpirationDate,
    certificateValidityPeriod, storeCertificate, issuedCertificateDate,
    selectProduceName];


  CertificateState copyWith({
    CertificateStatus? status,
    String? certificateIssuerInterMediateCAName,
    String? certificateExpirationDate,
    String? certificateValidityPeriod,
    String? issuedCertificateDate,
    String? selectProduceName,
    List<CertificateDetailsModel>? storeCertificate,
  }) {
    return CertificateState(
      status: status ?? this.status,
      certificateIssuerInterMediateCAName: certificateIssuerInterMediateCAName ?? this.certificateIssuerInterMediateCAName,
      certificateExpirationDate: certificateExpirationDate ?? this.certificateExpirationDate,
      certificateValidityPeriod: certificateValidityPeriod ?? this.certificateValidityPeriod,
      issuedCertificateDate: issuedCertificateDate ?? this.issuedCertificateDate,
      selectProduceName: selectProduceName ?? this.selectProduceName,
      storeCertificate: storeCertificate ?? this.storeCertificate
    );
  }
}