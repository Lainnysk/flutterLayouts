import 'dart:io';

import 'package:path/path.dart';
import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/data/model/role.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  final int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'hahah.db');
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
              version: _version,
              onCreate: (dataBase, version) async {
                await onCreateTable(dataBase);
              },
              onUpgrade: (dataBase, oldVersion, newVersion) async {
                await onUpdateTable(dataBase);
              }));
    } else {
      dataBase = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) {},
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master;');

    for (var table in DataBaseRequest.tableList) {
      if (tables.contains(table)) {
        db.execute(DataBaseRequest.deleteTable(table));
      }
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var table in DataBaseRequest.createTableList) {
      await db.execute(table);
    }
    db.execute('PRAGMA foreign_keys=on');

    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    dataBase.close();

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(dataBase.path);
    } else {
      await deleteDatabase(_pathDB);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Клиент').toMap());


      db.insert(DataBaseRequest.tableUsers, User(login: 'justuser', password: 'pasSword!', roleId: RoleEnum.user.id).toMap());

      //db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователь').toMap());
      // db.insert(DataBaseRequest.tableUser, User(login: 'client', password: 'general', id_role: 2).toMap());
      // db.insert(DataBaseRequest.tableClient, Client(surname: 'Бобова', name: 'Германия', patronymic: 'Феофановна', id_user: 1).toMap());
      // db.insert(DataBaseRequest.tableCharacteristic, Characteristic(color: 'Синий', height: 10, width: 10, fragile: 1).toMap());
      // db.insert(DataBaseRequest.tableStorage, Storage(address: 'Багратионова 7').toMap());
      // db.insert(DataBaseRequest.tableProduct, Product(name: 'Молоко', description: 'Синяя коробка', cost: 90.8, quantity: 39, id_characteristic: 1, id_storage: 1).toMap());
      // db.insert(DataBaseRequest.tableProvider, Provider(orgName: 'МясПромТорг', telNum: '+78003561212', email: 'meatProm@torg.ru').toMap());
      // db.insert(DataBaseRequest.tableAdmission, Admission(dateOfAdmission: DateTime.now().toString(), quantity: 2, id_product: 1, id_provider: 1).toMap());
      // db.insert(DataBaseRequest.tableConsumption, Consumption(dateOfConsumption: DateTime.now().toString(), quantity: 1, id_product: 1, id_client: 1).toMap());
    } on DatabaseException catch (e) {
      print("АХАХАХАХ");
    }
  }
}
