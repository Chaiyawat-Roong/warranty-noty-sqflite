// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      serial: json['serial'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      expDate: json['expDate'] == null
          ? null
          : DateTime.parse(json['expDate'] as String),
      expTime: json['expTime'] as int?,
      expType: json['expType'] as String?,
      insurer: json['insurer'] as String?,
      isExp: json['isExp'] as bool?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'serial': instance.serial,
      'date': instance.date?.toIso8601String(),
      'expDate': instance.expDate?.toIso8601String(),
      'expTime': instance.expTime,
      'expType': instance.expType,
      'insurer': instance.insurer,
      'isExp': instance.isExp,
    };
