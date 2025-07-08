class AreaModel {
  final int? subGroupId;
  final int? clusterId;
  final int areaId;
  final String areaName;

  AreaModel({
    this.subGroupId,
    this.clusterId,
    required this.areaId,
    required this.areaName,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      subGroupId: json['SUB_GROUP_ID'],
      clusterId: json['CLUSTER_ID'],
      areaId: json['AREA_ID'],
      areaName: json['AREA_NAME'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SUB_GROUP_ID': subGroupId,
      'CLUSTER_ID': clusterId,
      'AREA_ID': areaId,
      'AREA_NAME': areaName,
    };
  }
}
