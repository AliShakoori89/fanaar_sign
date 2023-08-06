import 'package:fanar_sign/database/data_base.dart';
import 'package:fanar_sign/model/certificate_model.dart';

class CertificateRepository{
  late final DatabaseHelper helper;

  CertificateRepository(){
    helper = DatabaseHelper();
  }

  Future<bool> saveCertificateRepo(CertificateModel certificateModel) async{
    return await helper.saveCertificate(certificateModel);
  }

  Future<List<CertificateModel>> getAllCertificates () async{
    return await helper.getAllCertificate();
  }
}