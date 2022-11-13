class ClientEntity {
  int? id;
  late String name;
  late String surname;
  late String patronymic;
  late int id_user;

  ClientEntity({required this.name, required this.surname, required this.patronymic, required this.id_user});
}