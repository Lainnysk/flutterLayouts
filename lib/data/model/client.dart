import 'package:pr2/domain/entity/client_entity.dart';

class Client extends ClientEntity {
  int? id;
  late String name;
  late String surname;
  late String patronymic;
  late int id_user;

  Client({required this.name, required this.surname, required this.patronymic, required this.id_user}) : super(name: name, surname: surname, patronymic: patronymic, id_user: id_user);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'id_user': id_user
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(name: json['name'], surname: json['surname'], patronymic: json['patronymic'], id_user: json['id_user']);
  }
}