import 'package:pr2/domain/entity/user_entity.dart';


class User extends UserEntity {
  int? id;
  late String login;
  late String password;
  late int id_role;


  User({required this.login, required this.password, required this.id_role}) : super(login: login, password: password, id_role: id_role);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'password': password,
      'id_role': id_role
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(login: json['login'], password: json['password'], id_role: json['id_role']);
  }
}