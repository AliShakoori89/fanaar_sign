import 'package:equatable/equatable.dart';

enum CertificateStatus { initial, success, error, loading }

extension CertificateStatusStatusX on CertificateStatus {
  bool get isInitial => this == CertificateStatus.initial;
  bool get isSuccess => this == CertificateStatus.success;
  bool get isError => this == CertificateStatus.error;
  bool get isLoading => this == CertificateStatus.loading;
}

class CertificateStatusState extends Equatable {

  const CertificateStatusState({
    this.status = CertificateStatus.initial,
    String? certificateIssuerInterMediateCA,

  }): certificateIssuerInterMediateCA = certificateIssuerInterMediateCA ?? ""



  final CertificateStatus status;
  @override
  // TODO: implement props
  List<Object> get props => [status];


  CertificateStatusState copyWith({
    CertificateStatus? status
  }) {
  }
}