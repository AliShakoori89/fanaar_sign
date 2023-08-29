import 'dart:io';
import 'package:fanar_sign/model/certificate_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper();

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const certificateTable = 'certificateTable';

  static const columnCertificateID = 'id';
  static const columnCertificateIssuerInterMediateCAName = 'certificateIssuerInterMediateCAName';
  static const columnSelectProduceName = 'selectProduceName';
  static const columnIssuedCertificateDate = 'issuedCertificateDate';
  static const columnCertificateExpirationDate = 'certificateExpirationDate';
  static const columnCertificateValidityPeriod = 'certificateValidityPeriod';
  static const columnCertificateSerialCode = 'certificateSerialCode';


  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  _initiateDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $certificateTable ('
        '$columnCertificateID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
        '$columnCertificateIssuerInterMediateCAName TEXT,'
        '$columnSelectProduceName TEXT,'
        '$columnIssuedCertificateDate TEXT,'
        '$columnCertificateExpirationDate TEXT,'
        '$columnCertificateValidityPeriod TEXT,'
        '$columnCertificateSerialCode TEXT'
        ')'
    );
  }

  Future<bool> saveCertificate(CertificateDetailsModel certificateModel) async {
    var dbCert = await database;
    await dbCert.insert(certificateTable, certificateModel.toJson());
    return true;
  }

  Future<List<CertificateDetailsModel>> getAllCertificate() async {
    var dbCert = await database;
    var listMap = await dbCert.rawQuery('SELECT * FROM $certificateTable');
    var listCertificates = <CertificateDetailsModel>[];
    for (Map<String, dynamic> m in listMap) {
      listCertificates.add(CertificateDetailsModel.fromJson(m));
    }
    print("0000000000000000000000       "+listMap.toString());
    return listCertificates;
  }

  Future<bool> existCertificate(String nationalCode, String selectProduceName) async {
    var dbCert = await database;
    print("55555555        "+ nationalCode);
    print("6666666666        "+selectProduceName);
    var listMap = await dbCert.rawQuery('SELECT * FROM $certificateTable WHERE $columnCertificateSerialCode = "$nationalCode" AND $columnSelectProduceName = "$selectProduceName"');
    print("777777777       "+listMap.toString());
    if(listMap.length == 0){
      print("                                                            false");
      return false;
    }else{
      print("                                                            true");
      return true;
    }
  }
}