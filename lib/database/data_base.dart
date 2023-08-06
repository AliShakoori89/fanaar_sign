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
  static const columnCertificateIssuerInterMediateCAName = 'columnCertificateIssuerInterMediateCAName';
  static const columnSelectProduceName = 'columnSelectProduceName';
  static const columnIssuedCertificateDate = 'columnIssuedCertificateDate';
  static const columnCertificateExpirationDate = 'columnCertificateExpirationDate';
  static const columnCertificateSerialCode = 'columnCertificateSerialCode';


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
        '$columnCertificateSerialCode TEXT'
        ')'
    );
  }

  Future<bool> saveCertificate(CertificateModel certificateModel) async {
    var dbCert = await database;
    print("@@@@@@@@@@@@         "+certificateModel.toJson().toString());
    await dbCert.insert(certificateTable, certificateModel.toJson());
    return true;
  }

  Future<List<CertificateModel>> getAllCertificate() async {
    var dbCert = await database;
    var listMap = await dbCert.rawQuery('SELECT * FROM $certificateTable');
    var listCertificates = <CertificateModel>[];
    print("555555555555555555       "+listMap.length.toString());
    for (Map<String, dynamic> m in listMap) {
      print("##############             "+m.toString());
      listCertificates.add(CertificateModel.fromJson(m));
    }
    return listCertificates;
  }
}