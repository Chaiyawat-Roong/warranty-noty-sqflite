import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? id;
  final String? name;
  final String? serial;
  final DateTime? date;
  final int? exptime;
  final String? exptype;
  final String? insurer;

  const Product({this.id, this.name, this.serial, this.date, this.exptime, this.exptype, this.insurer});

  Product copyWith({String? name, String? serial, DateTime? date, int? exptime, String? exptype, String? insurer}) {
    return Product(
      name: name ?? this.name,
      serial: serial ?? this.serial,
      date: date ?? this.date,
      exptime: exptime ?? this.exptime,
      exptype: exptype ?? this.exptype,
      insurer: insurer ?? this.insurer,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}