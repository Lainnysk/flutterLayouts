import 'package:pr2/domain/entity/consumption_entity.dart';

class Consumption extends ConsumptionEntity {
  int? id;
  late String dateOfConsumption;
  late int quantity;
  late int id_client;
  late int id_product;

  Consumption({required this.dateOfConsumption, required this.quantity, required this.id_client, required this.id_product}) : super(dateOfConsumption: dateOfConsumption, quantity: quantity, id_client: id_client, id_product: id_product);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateOfConsumption': dateOfConsumption,
      'quantity': quantity,
      'id_client': id_client,
      'id_product': id_product,
    };    
  }

  factory Consumption.toFromMap(Map<String, dynamic> json) {
    return Consumption(dateOfConsumption: json['dateOfConsumption'], 
        quantity: json['quantity'],
        id_client: json['id_client'],
        id_product: json['id_product']);
  }
}