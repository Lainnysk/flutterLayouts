
import 'package:dartz/dartz.dart';
import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/domain/entity/repositories/auth_repository.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _db = DataBaseHelper.instance.dataBase;

  String table = DataBaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var user = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );

      if (user.isEmpty) {
        return Left('Такого пользователя нет');
      }

      if (user.first['password'] != password) {
        return Left('Пароль пользователя неверный');
      }

  return Right(RoleEnum.values[(user.first['roleId'] as int)]);
    } on DatabaseException catch (error) {
      return Left(error.result.toString());
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      _db.insert(
        table,
        User(login: login, password: password, roleId: RoleEnum.user.id).toMap(),
      );
      return Right(true);
    } on DatabaseException catch (error) {
      return Left('Ошибка');
    }
    //throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> checkLoginExists(String login) async {
    try {
      var user = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );
      if (user.isEmpty) {
        return Left('Пользователя с таким логином не существует');
      }
      return Right(true);
    } on DatabaseException catch (error) {
      return Left("Ошибка");
    }
  }
}
