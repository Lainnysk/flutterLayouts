class ProductEntity {
  int? id;
  late String name;
  late String description;
  late double cost;
  late int quantity;
  late int id_storage;
  late int id_characteristic;

  ProductEntity({required this.name, 
  required this.description, 
  required this.cost, 
  required this.quantity, 
  required this.id_storage, 
  required this.id_characteristic});
}