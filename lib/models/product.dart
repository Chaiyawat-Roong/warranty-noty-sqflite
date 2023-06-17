import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? name;
  final String? serial;
  final DateTime? date;
  final DateTime? expDate;
  final int? expTime;
  final String? expType;
  final String? insurer;
  final bool? isExp;

  const Product({this.name, this.serial, this.date, this.expDate, this.expTime, this.expType, this.insurer, this.isExp});

  Product copyWith({String? name, String? serial, DateTime? date, DateTime? expDate, int? expTime, String? expType, String? insurer, bool? isExp}) {
    return Product(
      name: name ?? this.name,
      serial: serial ?? this.serial,
      date: date ?? this.date,
      expDate: expDate ?? this.expDate,
      expTime: expTime ?? this.expTime,
      expType: expType ?? this.expType,
      insurer: insurer ?? this.insurer,
      isExp: isExp ?? this.isExp
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}