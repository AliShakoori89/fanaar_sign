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
  static const columnCertificateIssuerInterMediateCA = 'columnCertificateIssuerInterMediateCA';
  static const columnCertificateExpirationDate = 'columnCertificateExpirationDate';
  static const columnCertificateValidityPeriod = 'columnValidityPeriod';



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
        '$columnCertificateIssuerInterMediateCA TEXT,'
        '$columnCertificateExpirationDate TEXT,'
        '$columnCertificateValidityPeriod TEXT'
        ')'
    );
  }

  Future<bool> saveCertificate(CertificateModel certificateModel) async {
    var dbExpense = await database;
    await dbExpense.insert(certificateTable, certificateModel.toJson());
    return true;
  }

  Future<List<CertificateModel>> getAllCertificate() async {
    var dbExpense = await database;
    var listMap = await dbExpense.rawQuery('SELECT * FROM $certificateTable');
    var listIncomeItems = <CertificateModel>[];
    for (Map<String, dynamic> m in listMap) {
      listIncomeItems.add(CertificateModel.fromJson(m));
    }
    return listIncomeItems;
  }
}