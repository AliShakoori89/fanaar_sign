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
    List<CertificateModel>? storeCertificate,
  }):certificateIssuerInterMediateCAName = certificateIssuerInterMediateCAName ?? "",
        certificateExpirationDate = certificateExpirationDate ?? "",
        certificateValidityPeriod = certificateValidityPeriod ?? "",
        storeCertificate = storeCertificate ?? const [];
  final CertificateStatus status;
  final String certificateIssuerInterMediateCAName;
  final String certificateExpirationDate;
  final String certificateValidityPeriod;
  final List<CertificateModel> storeCertificate;

  @override
  // TODO: implement props
  List<Object> get props => [status,
    certificateIssuerInterMediateCAName, certificateExpirationDate,
    certificateValidityPeriod, storeCertificate];


  CertificateState copyWith({
    CertificateStatus? status,
    String? certificateIssuerInterMediateCAName,
    String? certificateExpirationDate,
    String? certificateValidityPeriod,
    List<CertificateModel>? storeCertificate,
  }) {
    return CertificateState(
      status: status ?? this.status,
      certificateIssuerInterMediateCAName: certificateIssuerInterMediateCAName ?? this.certificateIssuerInterMediateCAName,
      certificateExpirationDate: certificateExpirationDate ?? this.certificateExpirationDate,
      certificateValidityPeriod: certificateValidityPeriod ?? this.certificateValidityPeriod,
      storeCertificate: storeCertificate ?? this.storeCertificate
    );
  }
}