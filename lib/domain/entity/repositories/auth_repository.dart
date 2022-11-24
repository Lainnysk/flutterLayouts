import 'package:pr2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, RoleEnum>> signIn(String login, String password);
  Future<Either<String, bool>> signUp(String login, String password);
}