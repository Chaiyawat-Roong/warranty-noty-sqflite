// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      serial: json['serial'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      exptime: json['exptime'] as int?,
      exptype: json['exptype'] as String?,
      insurer: json['insurer'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'serial': instance.serial,
      'date': instance.date?.toIso8601String(),
      'exptime': instance.exptime,
      'exptype': instance.exptype,
      'insurer': instance.insurer,
    };
