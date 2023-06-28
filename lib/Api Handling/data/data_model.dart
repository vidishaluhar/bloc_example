import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class DataModel
{
  final String title;
  final String body;

  DataModel(this.title, this.body);

  factory DataModel.fromMap(Map<String,dynamic> map) => _$DataModelFromJson(map);

  Map<String,dynamic> toMap() => _$DataModelToJson(this);
}