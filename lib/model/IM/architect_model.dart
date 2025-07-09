class ArchitectModel {
  final dynamic actualId;
  final dynamic generalCustomerId;
  final dynamic painterId;
  final dynamic planId;
  final dynamic clusterId;
  final dynamic painterAreaId;
  final dynamic painterType;
  final dynamic associatedSalesOfficer;
  final dynamic painterName;
  final String? phoneNumber;
  final dynamic market;
  final dynamic walletNumber;
  final dynamic cardNumber;
  final dynamic address;
  final dynamic isLeadProvided;
  final dynamic location;
  final dynamic areaName;
  final dynamic giveAways;
  final dynamic painterTotalCount;
  final dynamic leadCount;
  final double? registrationId;
  final dynamic createdOn;
  final dynamic createdBy;
  final dynamic customerType;
  final dynamic isPainter;
  final dynamic planType;
  final dynamic customerNameAddress;
  final dynamic associationStatus;
  final dynamic customerNumber;
  final dynamic areaId;
  final String? salesForceId;
  final String? salesForceName;
  final dynamic podSalesId;
  final dynamic podName;
  final dynamic subType;
  final dynamic isPainterLc;
  final dynamic creationDate;
  final int? cityId;
  final String? cityName;
  final dynamic ccRemarks;
  final dynamic processFlag;
  final String? personType;
  final String? personName;

  ArchitectModel({
    this.actualId,
    this.generalCustomerId,
    this.painterId,
    this.planId,
    this.clusterId,
    this.painterAreaId,
    this.painterType,
    this.associatedSalesOfficer,
    this.painterName,
    this.phoneNumber,
    this.market,
    this.walletNumber,
    this.cardNumber,
    this.address,
    this.isLeadProvided,
    this.location,
    this.areaName,
    this.giveAways,
    this.painterTotalCount,
    this.leadCount,
    this.registrationId,
    this.createdOn,
    this.createdBy,
    this.customerType,
    this.isPainter,
    this.planType,
    this.customerNameAddress,
    this.associationStatus,
    this.customerNumber,
    this.areaId,
    this.salesForceId,
    this.salesForceName,
    this.podSalesId,
    this.podName,
    this.subType,
    this.isPainterLc,
    this.creationDate,
    this.cityId,
    this.cityName,
    this.ccRemarks,
    this.processFlag,
    this.personType,
    this.personName,
  });

  factory ArchitectModel.fromJson(Map<String, dynamic> json) {
    return ArchitectModel(
      actualId: json['ACTUAL_ID'],
      generalCustomerId: json['GENERAL_CUSTOMER_ID'],
      painterId: json['PAINTER_ID'],
      planId: json['PLAN_ID'],
      clusterId: json['CLUSTER_ID'],
      painterAreaId: json['PAINTER_AREA_ID'],
      painterType: json['PAINTER_TYPE'],
      associatedSalesOfficer: json['ASSOCIATED_SALES_OFFICER'],
      painterName: json['PAINTER_NAME'],
      phoneNumber: json['PHONE_NUMBER'],
      market: json['MARKET'],
      walletNumber: json['WALLET_NUMBER'],
      cardNumber: json['CARD_NUMBER'],
      address: json['ADDRESS'],
      isLeadProvided: json['IS_LEAD_PROVIDED'],
      location: json['LOCATION'],
      areaName: json['AREA_NAME'],
      giveAways: json['GIVE_AWAYS'],
      painterTotalCount: json['PAINTER_TOTAL_COUNT'],
      leadCount: json['LEAD_COUNT'],
      registrationId: (json['REGISTRATION_ID'] as num?)?.toDouble(),
      createdOn: json['CREATED_ON'],
      createdBy: json['CREATED_BY'],
      customerType: json['CUSTOMER_TYPE'],
      isPainter: json['IS_PAINTER'],
      planType: json['PLAN_TYPE'],
      customerNameAddress: json['CUSTOMER_NAME_ADDRESS'],
      associationStatus: json['ASSOCIATION_STATUS'],
      customerNumber: json['CUSTOMER_NUMBER'],
      areaId: json['AREA_ID'],
      salesForceId: json['SALES_FORCE_ID'],
      salesForceName: json['SALES_FORCE_NAME'],
      podSalesId: json['POD_SALES_ID'],
      podName: json['POD_NAME'],
      subType: json['SUB_TYPE'],
      isPainterLc: json['IS_PAINTER_LC'],
      creationDate: json['CREATION_DATE'],
      cityId: json['CITY_ID'],
      cityName: json['CITY_NAME'],
      ccRemarks: json['CC_REMARKS'],
      processFlag: json['PROCESS_FLAG'],
      personType: json['PERSON_TYPE'],
      personName: json['PERSON_NAME'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ACTUAL_ID": actualId,
      "GENERAL_CUSTOMER_ID": generalCustomerId,
      "PAINTER_ID": painterId,
      "PLAN_ID": planId,
      "CLUSTER_ID": clusterId,
      "PAINTER_AREA_ID": painterAreaId,
      "PAINTER_TYPE": painterType,
      "ASSOCIATED_SALES_OFFICER": associatedSalesOfficer,
      "PAINTER_NAME": painterName,
      "PHONE_NUMBER": phoneNumber,
      "MARKET": market,
      "WALLET_NUMBER": walletNumber,
      "CARD_NUMBER": cardNumber,
      "ADDRESS": address,
      "IS_LEAD_PROVIDED": isLeadProvided,
      "LOCATION": location,
      "AREA_NAME": areaName,
      "GIVE_AWAYS": giveAways,
      "PAINTER_TOTAL_COUNT": painterTotalCount,
      "LEAD_COUNT": leadCount,
      "REGISTRATION_ID": registrationId,
      "CREATED_ON": createdOn,
      "CREATED_BY": createdBy,
      "CUSTOMER_TYPE": customerType,
      "IS_PAINTER": isPainter,
      "PLAN_TYPE": planType,
      "CUSTOMER_NAME_ADDRESS": customerNameAddress,
      "ASSOCIATION_STATUS": associationStatus,
      "CUSTOMER_NUMBER": customerNumber,
      "AREA_ID": areaId,
      "SALES_FORCE_ID": salesForceId,
      "SALES_FORCE_NAME": salesForceName,
      "POD_SALES_ID": podSalesId,
      "POD_NAME": podName,
      "SUB_TYPE": subType,
      "IS_PAINTER_LC": isPainterLc,
      "CREATION_DATE": creationDate,
      "CITY_ID": cityId,
      "CITY_NAME": cityName,
      "CC_REMARKS": ccRemarks,
      "PROCESS_FLAG": processFlag,
      "PERSON_TYPE": personType,
      "PERSON_NAME": personName,
    };
  }
}
