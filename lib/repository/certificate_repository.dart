import 'package:fanar_sign/database/data_base.dart';
import 'package:fanar_sign/model/certificate_model.dart';

class CertificateRepository{
  late final DatabaseHelper helper;

  CertificateRepository(){
    helper = DatabaseHelper();
  }

  Future<bool> saveCertificateRepo(CertificateModel certificateModel) async{
    print("saaaaave                      "+certificateModel.certificateSerialCode.toString());
    print("saaaaave                      "+certificateModel.selectProduceName.toString());
    print("saaaaave                      "+certificateModel.issuedCertificateDate.toString());
    print("saaaaave                      "+certificateModel.certificateIssuerInterMediateCA.toString());
    return await helper.saveCertificate(certificateModel);
  }

  Future<List<CertificateModel>> getAllCertificates () async{
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!");
    return await helper.getAllCertificate();
  }
}