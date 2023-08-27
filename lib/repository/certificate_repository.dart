import 'package:fanar_sign/database/data_base.dart';
import 'package:fanar_sign/model/certificate_model.dart';

class CertificateRepository{
  late final DatabaseHelper helper;

  CertificateRepository(){
    helper = DatabaseHelper();
  }

  Future<bool> saveCertificateRepo(CertificateDetailsModel certificateModel) async{
    return await helper.saveCertificate(certificateModel);
  }

  Future<List<CertificateDetailsModel>> getAllCertificates () async{
    return await helper.getAllCertificate();
  }

  Future<bool> existCertificate (String nationalCode, String selectProduceName) async{
    return await helper.existCertificate(nationalCode, selectProduceName);
  }
}