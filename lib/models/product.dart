import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? name;
  final String? serial;
  final DateTime? date;
  final int? expTime;
  final String? expType;
  final String? insurer;
  final int? remaining;
  final bool? isExp;

  const Product({this.name, this.serial, this.date, this.expTime, this.expType, this.insurer, this.remaining, this.isExp});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}