import 'package:pr2/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  int? id;
  late String name;
  late String description;
  late double cost;
  late int quantity;
  late int id_storage;
  late int id_characteristic;

  Product({required this.name, 
    required this.description, 
    required this.cost,
    required this.quantity,
    required this.id_storage,
    required this.id_characteristic}) : super(name: name, description: description, cost: cost, quantity: quantity, id_storage: id_storage, id_characteristic: id_characteristic);
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cost': cost,
      'quantity': quantity,
      'id_storage': id_storage,
      'id_characteristic': id_characteristic
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(name: json['name'], 
        description: json['description'], 
        cost: json['cost'],
        quantity: json['quantity'],
        id_storage: json['id_storage'],
        id_characteristic: json['id_characteristic']
    );
  }
}