class PlanModel {
  final String activeMonth;
  final int areaId;
  final String areaName;
  final int cityId;
  final String cityName;
  final dynamic userPlanning;
  final dynamic createdBy;
  final dynamic createdOn;
  final String enabled;
  final DateTime endDate;
  final int noOfVisits;
  final int achievement;
  final int planId;
  final String planType;
  final String planTypeDesc;
  final String salesForceId;
  final dynamic salesForceName;
  final DateTime startDate;
  final String startEndDate;
  final dynamic updatedBy;
  final dynamic updatedOn;
  final int userRole;
  final int weeklyFrequency;
  final String zoneDesc;
  final int zoneId;

  PlanModel({
    required this.activeMonth,
    required this.areaId,
    required this.areaName,
    required this.cityId,
    required this.cityName,
    this.userPlanning,
    this.createdBy,
    this.createdOn,
    required this.enabled,
    required this.endDate,
    required this.noOfVisits,
    required this.achievement,
    required this.planId,
    required this.planType,
    required this.planTypeDesc,
    required this.salesForceId,
    this.salesForceName,
    required this.startDate,
    required this.startEndDate,
    this.updatedBy,
    this.updatedOn,
    required this.userRole,
    required this.weeklyFrequency,
    required this.zoneDesc,
    required this.zoneId,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      activeMonth: json['ACTIVE_MONTH'],
      areaId: json['AREA_ID'],
      areaName: json['AREA_NAME'],
      cityId: json['CITY_ID'],
      cityName: json['CITY_NAME'],
      userPlanning: json['USER_PLANNING'],
      createdBy: json['CREATED_BY'],
      createdOn: json['CREATED_ON'],
      enabled: json['ENABLED'],
      endDate: DateTime.parse(json['END_DATE']),
      noOfVisits: json['NO_OF_VISITS'],
      achievement: json['ACHIEVEMENT'],
      planId: json['PLAN_ID'],
      planType: json['PLAN_TYPE'],
      planTypeDesc: json['PLAN_TYPE_DESC'],
      salesForceId: json['SALES_FORCE_ID'],
      salesForceName: json['SALES_FORCE_NAME'],
      startDate: DateTime.parse(json['START_DATE']),
      startEndDate: json['START_END_DATE'],
      updatedBy: json['UPDATED_BY'],
      updatedOn: json['UPDATED_ON'],
      userRole: json['USER_ROLE'],
      weeklyFrequency: json['WEEKLY_FREQUENCY'],
      zoneDesc: json['ZONE_DESC'],
      zoneId: json['ZONE_ID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ACTIVE_MONTH': activeMonth,
      'AREA_ID': areaId,
      'AREA_NAME': areaName,
      'CITY_ID': cityId,
      'CITY_NAME': cityName,
      'USER_PLANNING': userPlanning,
      'CREATED_BY': createdBy,
      'CREATED_ON': createdOn,
      'ENABLED': enabled,
      'END_DATE': endDate.toIso8601String(),
      'NO_OF_VISITS': noOfVisits,
      'ACHIEVEMENT': achievement,
      'PLAN_ID': planId,
      'PLAN_TYPE': planType,
      'PLAN_TYPE_DESC': planTypeDesc,
      'SALES_FORCE_ID': salesForceId,
      'SALES_FORCE_NAME': salesForceName,
      'START_DATE': startDate.toIso8601String(),
      'START_END_DATE': startEndDate,
      'UPDATED_BY': updatedBy,
      'UPDATED_ON': updatedOn,
      'USER_ROLE': userRole,
      'WEEKLY_FREQUENCY': weeklyFrequency,
      'ZONE_DESC': zoneDesc,
      'ZONE_ID': zoneId,
    };
  }
}
