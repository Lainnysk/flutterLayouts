import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class UserEntity {
  int? id;
  final String login;
  final String password;
  final int roleId;

  UserEntity({
      required this.login, 
      required this.password, 
      required this.roleId
      });
}
