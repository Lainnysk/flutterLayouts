abstract class DataBaseRequest {
  /// Запрос для удаления таблиц
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'Role';
  static const String tableUser = 'User';
  static const String tableClient = 'Client';
  static const String tableCharacteristic = 'Characteristic';
  static const String tableStorage = 'Storage';
  static const String tableProduct = 'Product';
  static const String tableProvider = 'Provider';
  static const String tableAdmission = 'Admission';
  static const String tableConsumption = 'Consumption';

  static const List<String> tableList = [tableRole, tableUser, tableClient, 
                                        tableCharacteristic, tableStorage, tableProduct,
                                        tableProvider, tableAdmission, tableConsumption];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableUser,
    _createTableClient,
    _createTableCharacteristic,
    _createTableStorage,
    _createTableProduct,
    _createTableProvider,
    _createTableAdmission,
    _createTableConsumption
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id"),PRIMARY KEY("id"))';
  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id"	INTEGER,"surname"	TEXT NOT NULL,"name"	TEXT NOT NULL,"patronymic" TEXT	NOT NULL,"id_user"	INTEGER,FOREIGN KEY("id_user") REFERENCES "User"("id"),PRIMARY KEY("id"))';
  static const String _createTableCharacteristic =
      'CREATE TABLE "$tableCharacteristic" ("id"	INTEGER,"color"	TEXT NOT NULL,"width"	DOUBLE NOT NULL,"height"	DOUBLE NOT NULL,"fragile"	BOOLEAN NOT NULL,PRIMARY KEY("id"))';
  static const String _createTableStorage =
      'CREATE TABLE "$tableStorage" ("id"	INTEGER,"address"	TEXT NOT NULL,PRIMARY KEY("id"))';
  static const String _createTableProduct =
      'CREATE TABLE "$tableProduct" ("id"	INTEGER,"name"	TEXT NOT NULL,"description"	TEXT NOT NULL,"cost"	DOUBLE NOT NULL,"quantity"	INTEGER NOT NULL,"id_storage"	INTEGER,"id_characteristic"	INTEGER,FOREIGN KEY("id_storage") REFERENCES "Storage"("id"),FOREIGN KEY("id_characteristic") REFERENCES "Characteristic"("id"),PRIMARY KEY("id"))';
  static const String _createTableProvider =
      'CREATE TABLE "$tableProvider" ("id"	INTEGER,"orgName"	TEXT NOT NULL,"telNum"	TEXT NOT NULL,"email"	TEXT NOT NULL,PRIMARY KEY("id"))';
  static const String _createTableAdmission =
      'CREATE TABLE "$tableAdmission" ("id"	INTEGER,"dateOfAdmission"	DATETIME NOT NULL,"quantity"	INTEGER NOT NULL,"id_provider"	INTEGER,"id_product"	INTEGER,FOREIGN KEY("id_provider") REFERENCES "Provider"("id"),FOREIGN KEY("id_product") REFERENCES "Product"("id"),PRIMARY KEY("id"))';
  static const String _createTableConsumption =
      'CREATE TABLE "$tableConsumption" ("id"	INTEGER,"dateOfConsumption"	DATETIME NOT NULL,"quantity"	INTEGER NOT NULL,"id_client"	INTEGER,"id_product"	INTEGER,FOREIGN KEY("id_client") REFERENCES "Client"("id"),FOREIGN KEY("id_product") REFERENCES "Product"("id"),PRIMARY KEY("id"))';
}
