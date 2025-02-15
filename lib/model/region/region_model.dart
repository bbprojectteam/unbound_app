

import 'package:json_annotation/json_annotation.dart';

part 'region_model.g.dart'; // 생성될 파일

@JsonSerializable()
class RegionModel {

  int? id; // 지역 ID

  String? name; // 지역명

  String? type; // 지역 타입

  int? depth; // 지역 레벨 (상위/하위 지역 구분)

  int? parentId; // 상위 지역 ID (없으면 null)

  RegionModel();

  factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}