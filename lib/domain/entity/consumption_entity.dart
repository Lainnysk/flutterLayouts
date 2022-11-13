class ConsumptionEntity {
  int? id;
  late String dateOfConsumption;
  late int quantity;
  late int id_client;
  late int id_product;

  ConsumptionEntity({required this.dateOfConsumption, 
  required this.quantity,
  required this.id_client, 
  required this.id_product});
}