import 'package:pr2/domain/entity/storage_entity.dart';

class Storage extends StorageEntity {
  int? id;
  late String address;

  Storage({required this.address}) : super(address: address);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address
    };
  }

  factory Storage.toFromMap(Map<String, dynamic> json) {
    return Storage(address: json['address']);
  }
}