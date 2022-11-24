class RoleEntity {
  int? id;
  late String role;

  RoleEntity({required this.role});
}

enum RoleEnum {
  who(
    id: 0,
    role: 'Нет',
  ),
  admin(
    id: 1,
    role: 'Администратор',
  ),
  user(
    id: 2,
    role: 'Клиент',
  );

  const RoleEnum({
    required this.id,
    required this.role,
  });

  final int id;
  final String role;
}
