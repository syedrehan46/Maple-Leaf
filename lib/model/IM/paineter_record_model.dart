class IndividualPainterPlanModel {
  final int? planId;
  final int? cityId;
  final dynamic weeklyFrequency;
  final int? actualId;
  final dynamic clusterId;
  final int? subGroupId;
  final dynamic painterEngagementCount;
  final dynamic laborEngagementCount;
  final dynamic totalCount;
  final dynamic newPainterCount;
  final dynamic achievement;
  final dynamic totalTarget;
  final dynamic totalTargetIml;
  final dynamic totalTargetNpi;
  final dynamic totalTargetImp;
  final dynamic totalPainters;
  final dynamic planCount;
  final int? leadCount;
  final dynamic createdBy;
  final dynamic target;
  final dynamic startEndDate;
  final String? startDate;
  final String? endDate;
  final String? status;
  final dynamic enabled;
  final String? planType;
  final String? cityName;
  final dynamic createdOn;
  final dynamic planDesc;
  final String? subGroupName;
  final String? salesForceId;
  final String? activeMonth;
  final String? painterName;
  final String? phoneNumber;
  final String? painterMeetupDate;
  final double? registrationId;

  IndividualPainterPlanModel({
    this.planId,
    this.cityId,
    this.weeklyFrequency,
    this.actualId,
    this.clusterId,
    this.subGroupId,
    this.painterEngagementCount,
    this.laborEngagementCount,
    this.totalCount,
    this.newPainterCount,
    this.achievement,
    this.totalTarget,
    this.totalTargetIml,
    this.totalTargetNpi,
    this.totalTargetImp,
    this.totalPainters,
    this.planCount,
    this.leadCount,
    this.createdBy,
    this.target,
    this.startEndDate,
    this.startDate,
    this.endDate,
    this.status,
    this.enabled,
    this.planType,
    this.cityName,
    this.createdOn,
    this.planDesc,
    this.subGroupName,
    this.salesForceId,
    this.activeMonth,
    this.painterName,
    this.phoneNumber,
    this.painterMeetupDate,
    this.registrationId,
  });

  factory IndividualPainterPlanModel.fromJson(Map<String, dynamic> json) {
    return IndividualPainterPlanModel(
      planId: json['PLAN_ID'],
      cityId: json['CITY_ID'],
      weeklyFrequency: json['WEEKLY_FREQUENCY'],
      actualId: json['ACTUAL_ID'],
      clusterId: json['CLUSTER_ID'],
      subGroupId: json['SUB_GROUP_ID'],
      painterEngagementCount: json['PAINTER_ENGAGMENT_COUNT'],
      laborEngagementCount: json['LABOR_ENGAGMENT_COUNT'],
      totalCount: json['TOTAL_COUNT'],
      newPainterCount: json['NEW_PAINTER_COUNT'],
      achievement: json['ACHIEVEMENT'],
      totalTarget: json['TOTAL_TARGET'],
      totalTargetIml: json['TOTAL_TARGET_IML'],
      totalTargetNpi: json['TOTAL_TARGET_NPI'],
      totalTargetImp: json['TOTAL_TARGET_IMP'],
      totalPainters: json['TOTAL_PAINTERS'],
      planCount: json['PLAN_COUNT'],
      leadCount: json['LEAD_COUNT'],
      createdBy: json['CREATED_BY'],
      target: json['TARGET'],
      startEndDate: json['START_END_DATE'],
      startDate: json['START_DATE'],
      endDate: json['END_DATE'],
      status: json['STATUS'],
      enabled: json['ENABLED'],
      planType: json['PLAN_TYPE'],
      cityName: json['CITY_NAME'],
      createdOn: json['CREATED_ON'],
      planDesc: json['PLAN_DESC'],
      subGroupName: json['SUB_GROUP_NAME'],
      salesForceId: json['SALES_FORCE_ID'],
      activeMonth: json['ACTIVE_MONTH'],
      painterName: json['PAINTER_NAME'],
      phoneNumber: json['PHONE_NUMBER'],
      painterMeetupDate: json['PAINTER_MEETUP_DATE'],
      registrationId: (json['REGISTRATION_ID'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PLAN_ID': planId,
      'CITY_ID': cityId,
      'WEEKLY_FREQUENCY': weeklyFrequency,
      'ACTUAL_ID': actualId,
      'CLUSTER_ID': clusterId,
      'SUB_GROUP_ID': subGroupId,
      'PAINTER_ENGAGMENT_COUNT': painterEngagementCount,
      'LABOR_ENGAGMENT_COUNT': laborEngagementCount,
      'TOTAL_COUNT': totalCount,
      'NEW_PAINTER_COUNT': newPainterCount,
      'ACHIEVEMENT': achievement,
      'TOTAL_TARGET': totalTarget,
      'TOTAL_TARGET_IML': totalTargetIml,
      'TOTAL_TARGET_NPI': totalTargetNpi,
      'TOTAL_TARGET_IMP': totalTargetImp,
      'TOTAL_PAINTERS': totalPainters,
      'PLAN_COUNT': planCount,
      'LEAD_COUNT': leadCount,
      'CREATED_BY': createdBy,
      'TARGET': target,
      'START_END_DATE': startEndDate,
      'START_DATE': startDate,
      'END_DATE': endDate,
      'STATUS': status,
      'ENABLED': enabled,
      'PLAN_TYPE': planType,
      'CITY_NAME': cityName,
      'CREATED_ON': createdOn,
      'PLAN_DESC': planDesc,
      'SUB_GROUP_NAME': subGroupName,
      'SALES_FORCE_ID': salesForceId,
      'ACTIVE_MONTH': activeMonth,
      'PAINTER_NAME': painterName,
      'PHONE_NUMBER': phoneNumber,
      'PAINTER_MEETUP_DATE': painterMeetupDate,
      'REGISTRATION_ID': registrationId,
    };
  }
}
