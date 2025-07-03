class CityModel {
  final String? cityCode;
  final int? cityId;
  final String? cityid;
  final String? zoneId;
  final String? zoneDesc;
  final String? cityName;
  final int? sqlCityId;
  final String? regionid;
  final String? regionalHeadId;
  final String? regionalHeadName;
  final String? phaseId;
  final String? cityBelongs;
  final int? id;
  final String? areaId;
  final String? areaName;
  final String? name;
  final String? salesForceId;
  final String? enabled;
  final String? transactionId;
  final String? targetQtyKg;

  CityModel({
    this.cityCode,
    this.cityId,
    this.cityid,
    this.zoneId,
    this.zoneDesc,
    this.cityName,
    this.sqlCityId,
    this.regionid,
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

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      cityCode: json['CITY_CODE'],
      cityId: json['CITY_ID'],
      cityid: json['CITYID'],
      zoneId: json['ZONE_ID'],
      zoneDesc: json['ZONE_DESC'],
      cityName: json['CITY_NAME'],
      sqlCityId: json['SQL_CITY_ID'],
      regionid: json['REGIONID'],
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
      'CITYID': cityid,
      'ZONE_ID': zoneId,
      'ZONE_DESC': zoneDesc,
      'CITY_NAME': cityName,
      'SQL_CITY_ID': sqlCityId,
      'REGIONID': regionid,
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
