import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? id;
  final String? name;
  final String? serial;
  final DateTime? date;
  final int? expTime;
  final String? expType;
  final String? insurer;

  const Product({this.id, this.name, this.serial, this.date, this.expTime, this.expType, this.insurer});

  Product copyWith({String? name, String? serial, DateTime? date, int? expTime, String? expType, String? insurer}) {
    return Product(
      name: name ?? this.name,
      serial: serial ?? this.serial,
      date: date ?? this.date,
      expTime: expTime ?? this.expTime,
      expType: expType ?? this.expType,
      insurer: insurer ?? this.insurer,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}