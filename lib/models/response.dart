import 'package:json_annotation/json_annotation.dart';
import 'package:warranty_noty/models/product.dart';

part 'response.g.dart';


@JsonSerializable()
class ResponseData{
  final String? message;
  final List<Product>? data;

  const ResponseData({this.message, this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}