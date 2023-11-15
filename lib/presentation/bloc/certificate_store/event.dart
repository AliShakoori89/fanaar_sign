import '../../../data/model/certificate_model.dart';

abstract class CertificateEvent{
  List<Object> get props => [];
}

class SaveCertificateToStoreEvent extends CertificateEvent{
  final CertificateDetailsModel certificateModel;

  SaveCertificateToStoreEvent(
      {required this.certificateModel});

  @override
  List<Object> get props => [certificateModel];
}

class FetchAllCertificateEvent extends CertificateEvent {}

class ExistCertificateEvent extends CertificateEvent {
  final String nationalCode;
  final String selectProduceName;

  ExistCertificateEvent({
    required this.nationalCode,
    required this.selectProduceName});

  @override
  List<Object> get props => [nationalCode, selectProduceName];
}
