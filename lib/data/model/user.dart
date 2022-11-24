import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {
  int? id;
  late String login;
  late String password;
  late int roleId;

  
  User({
    required this.login,
    required this.password,
    required this.roleId,
  }) : super(login:login, password: password, roleId: roleId);

  Map<String, dynamic> toMap() {
    return {'id': id, 'login': login, 'password': password, 'roleId': roleId};
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      roleId: RoleEnum.values.firstWhere(
        (element) => element.id == (json['roleId'] as int),
      ).id
    );
  }
}
