class AreaModel {
  final dynamic cityCode;
  final int? cityId;
  final dynamic cityID;
  final dynamic zoneId;
  final dynamic zoneDesc;
  final dynamic cityName;
  final dynamic sqlCityId;
  final dynamic regionId;
  final dynamic regionalHeadId;
  final dynamic regionalHeadName;
  final dynamic phaseId;
  final dynamic cityBelongs;
  final int? id;
  final int? areaId;
  final String? areaName;
  final dynamic name;
  final dynamic salesForceId;
  final dynamic enabled;
  final dynamic transactionId;
  final dynamic targetQtyKg;

  AreaModel({
    this.cityCode,
    this.cityId,
    this.cityID,
    this.zoneId,
    this.zoneDesc,
    this.cityName,
    this.sqlCityId,
    this.regionId,
    this.regionalHeadId,
    this.regionalHeadName,
    this.phaseId,
    this.cityBelongs,
    this.id,
    this.areaId,
    this.areaName,
    this.name,
    this.salesForceId,
    this.enabled,
    this.transactionId,
    this.targetQtyKg,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      cityCode: json['CITY_CODE'],
      cityId: json['CITY_ID'],
      cityID: json['CITYID'],
      zoneId: json['ZONE_ID'],
      zoneDesc: json['ZONE_DESC'],
      cityName: json['CITY_NAME'],
      sqlCityId: json['SQL_CITY_ID'],
      regionId: json['REGIONID'],
      regionalHeadId: json['REGIONAL_HEAD_ID'],
      regionalHeadName: json['REGIONAL_HEAD_NAME'],
      phaseId: json['PHASE_ID'],
      cityBelongs: json['CITY_BELONGS'],
      id: json['ID'],
      areaId: json['AREA_ID'],
      areaName: json['AREA_NAME'],
      name: json['NAME'],
      salesForceId: json['SALES_FORCE_ID'],
      enabled: json['ENABLED'],
      transactionId: json['TRANSACTION_ID'],
      targetQtyKg: json['TARGET_QTY_KG'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CITY_CODE': cityCode,
      'CITY_ID': cityId,
      'CITYID': cityID,
      'ZONE_ID': zoneId,
      'ZONE_DESC': zoneDesc,
      'CITY_NAME': cityName,
      'SQL_CITY_ID': sqlCityId,
      'REGIONID': regionId,
      'REGIONAL_HEAD_ID': regionalHeadId,
      'REGIONAL_HEAD_NAME': regionalHeadName,
      'PHASE_ID': phaseId,
      'CITY_BELONGS': cityBelongs,
      'ID': id,
      'AREA_ID': areaId,
      'AREA_NAME': areaName,
      'NAME': name,
      'SALES_FORCE_ID': salesForceId,
      'ENABLED': enabled,
      'TRANSACTION_ID': transactionId,
      'TARGET_QTY_KG': targetQtyKg,
    };
  }
}
