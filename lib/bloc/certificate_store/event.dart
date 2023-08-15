import 'package:fanar_sign/model/certificate_model.dart';

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
