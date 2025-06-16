class LeadProcessingModel {
  final int? generalCustomerId;
  final int? registrationId;
  final int? sampleAppliedCount;
  final int? conversionCount;
  final int? customerAreaId;
  final int? tid;
  final int? expectedKgs;
  final int? actualId;
  final int? painterId;
  final String? customerName;
  final String? customerPhone;
  final String? leadFrom;
  final String? leadStatus;
  final String? via;
  final String? status;
  final String? salesForceId;
  final String? salesForceName;
  final String? painterName;
  final String? market;
  final String? phoneNumber;
  final String? cardNumber;
  final String? isPainter;
  final String? customerAreaName;
  final String? engagementPlanType;
  final String? createdOn;
  final String? followUpDate;
  final String? convertedToSale;
  final String? sampleApplied;
  final int? podSalesId;
  final String? podName;
  final int? noOfBags5Kg;
  final int? total5Kgs;
  final int? noOfBags20Kg;
  final int? total20Kgs;
  final int? noOfBags20KgRepaint;
  final int? total20KgRepaint;
  final int? noOfBags20KgExtputty;
  final int? total20KgExtputty;
  final int? noOfBags20KgSkimcoat;
  final int? total20KgSkimcoat;
  final String? retailerId;
  final String? leadConvertedDate;
  final String? leadCreationDate;
  final String? specialIncentive;
  final String? siteVisit;
  final String? productSold;
  final String? painterAutoConversion;
  final String? deliveredYn;
  final String? processedYn;
  final String? referredToPod;
  final String? retailerName;
  final int? cityId;
  final String? cityName;
  final String? leadType;
  final String? referredBySalesId;
  final String? leadReferral;
  final String? leadSource;

  LeadProcessingModel({
    this.generalCustomerId,
    this.registrationId,
    this.sampleAppliedCount,
    this.conversionCount,
    this.customerAreaId,
    this.tid,
    this.expectedKgs,
    this.actualId,
    this.painterId,
    this.customerName,
    this.customerPhone,
    this.leadFrom,
    this.leadStatus,
    this.via,
    this.status,
    this.salesForceId,
    this.salesForceName,
    this.painterName,
    this.market,
    this.phoneNumber,
    this.cardNumber,
    this.isPainter,
    this.customerAreaName,
    this.engagementPlanType,
    this.createdOn,
    this.followUpDate,
    this.convertedToSale,
    this.sampleApplied,
    this.podSalesId,
    this.podName,
    this.noOfBags5Kg,
    this.total5Kgs,
    this.noOfBags20Kg,
    this.total20Kgs,
    this.noOfBags20KgRepaint,
    this.total20KgRepaint,
    this.noOfBags20KgExtputty,
    this.total20KgExtputty,
    this.noOfBags20KgSkimcoat,
    this.total20KgSkimcoat,
    this.retailerId,
    this.leadConvertedDate,
    this.leadCreationDate,
    this.specialIncentive,
    this.siteVisit,
    this.productSold,
    this.painterAutoConversion,
    this.deliveredYn,
    this.processedYn,
    this.referredToPod,
    this.retailerName,
    this.cityId,
    this.cityName,
    this.leadType,
    this.referredBySalesId,
    this.leadReferral,
    this.leadSource,
  });

  factory LeadProcessingModel.fromJson(Map<String, dynamic> json) {
    return LeadProcessingModel(
      generalCustomerId: json['GENERAL_CUSTOMER_ID'],
      registrationId: json['REGISTRATION_ID'],
      sampleAppliedCount: json['SAMPLE_APPLIED_COUNT'],
      conversionCount: json['CONVERSION_COUNT'],
      customerAreaId: json['CUSTOMER_AREA_ID'],
      tid: json['TID'],
      expectedKgs: json['EXPECTED_KGS'],
      actualId: json['ACTUAL_ID'],
      painterId: json['PAINTER_ID'],
      customerName: json['CUSTOMER_NAME'],
      customerPhone: json['CUSTOMER_PHONE'],
      leadFrom: json['LEAD_FROM'],
      leadStatus: json['LEAD_STATUS'],
      via: json['VIA'],
      status: json['STATUS'],
      salesForceId: json['SALES_FORCE_ID'],
      salesForceName: json['SALES_FORCE_NAME'],
      painterName: json['PAINTER_NAME'],
      market: json['MARKET'],
      phoneNumber: json['PHONE_NUMBER'],
      cardNumber: json['CARD_NUMBER'],
      isPainter: json['IS_PAINTER'],
      customerAreaName: json['CUSTOMER_AREA_NAME'],
      engagementPlanType: json['ENGAGEMENT_PLAN_TYPE'],
      createdOn: json['CREATED_ON'],
      followUpDate: json['FOLLOW_UP_DATE'],
      convertedToSale: json['CONVERTED_TO_SALE'],
      sampleApplied: json['SAMPLE_APPLIED'],
      podSalesId: json['POD_SALES_ID'],
      podName: json['POD_NAME'],
      noOfBags5Kg: json['NO_OF_BAGS_5_KG'],
      total5Kgs: json['TOTAL_5_KGS'],
      noOfBags20Kg: json['NO_OF_BAGS_20_KG'],
      total20Kgs: json['TOTAL_20_KGS'],
      noOfBags20KgRepaint: json['NO_OF_BAGS_20_KG_REPAINT'],
      total20KgRepaint: json['TOTAL_20_KG_REPAINT'],
      noOfBags20KgExtputty: json['NO_OF_BAGS_20_KG_EXTPUTTY'],
      total20KgExtputty: json['TOTAL_20_KG_EXTPUTTY'],
      noOfBags20KgSkimcoat: json['NO_OF_BAGS_20_KG_SKIMCOAT'],
      total20KgSkimcoat: json['TOTAL_20_KG_SKIMCOAT'],
      retailerId: json['RETAILER_ID'],
      leadConvertedDate: json['LEAD_CONVERTED_DATE'],
      leadCreationDate: json['LEAD_CREATION_DATE'],
      specialIncentive: json['SPECIAL_INCENTIVE'],
      siteVisit: json['SITE_VISIT'],
      productSold: json['PRODUCT_SOLD'],
      painterAutoConversion: json['PAINTER_AUTO_CONVERSION'],
      deliveredYn: json['DELIVERED_YN'],
      processedYn: json['PROCESSED_YN'],
      referredToPod: json['REFERED_TO_POD'],
      retailerName: json['RETAILER_NAME'],
      cityId: json['CITY_ID'],
      cityName: json['CITY_NAME'],
      leadType: json['LEAD_TYPE'],
      referredBySalesId: json['REFERED_BY_SALES_ID'],
      leadReferral: json['LEAD_REFERAL'],
      leadSource: json['LEAD_SOURCE'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'GENERAL_CUSTOMER_ID': generalCustomerId,
      'REGISTRATION_ID': registrationId,
      'SAMPLE_APPLIED_COUNT': sampleAppliedCount,
      'CONVERSION_COUNT': conversionCount,
      'CUSTOMER_AREA_ID': customerAreaId,
      'TID': tid,
      'EXPECTED_KGS': expectedKgs,
      'ACTUAL_ID': actualId,
      'PAINTER_ID': painterId,
      'CUSTOMER_NAME': customerName,
      'CUSTOMER_PHONE': customerPhone,
      'LEAD_FROM': leadFrom,
      'LEAD_STATUS': leadStatus,
      'VIA': via,
      'STATUS': status,
      'SALES_FORCE_ID': salesForceId,
      'SALES_FORCE_NAME': salesForceName,
      'PAINTER_NAME': painterName,
      'MARKET': market,
      'PHONE_NUMBER': phoneNumber,
      'CARD_NUMBER': cardNumber,
      'IS_PAINTER': isPainter,
      'CUSTOMER_AREA_NAME': customerAreaName,
      'ENGAGEMENT_PLAN_TYPE': engagementPlanType,
      'CREATED_ON': createdOn,
      'FOLLOW_UP_DATE': followUpDate,
      'CONVERTED_TO_SALE': convertedToSale,
      'SAMPLE_APPLIED': sampleApplied,
      'POD_SALES_ID': podSalesId,
      'POD_NAME': podName,
      'NO_OF_BAGS_5_KG': noOfBags5Kg,
      'TOTAL_5_KGS': total5Kgs,
      'NO_OF_BAGS_20_KG': noOfBags20Kg,
      'TOTAL_20_KGS': total20Kgs,
      'NO_OF_BAGS_20_KG_REPAINT': noOfBags20KgRepaint,
      'TOTAL_20_KG_REPAINT': total20KgRepaint,
      'NO_OF_BAGS_20_KG_EXTPUTTY': noOfBags20KgExtputty,
      'TOTAL_20_KG_EXTPUTTY': total20KgExtputty,
      'NO_OF_BAGS_20_KG_SKIMCOAT': noOfBags20KgSkimcoat,
      'TOTAL_20_KG_SKIMCOAT': total20KgSkimcoat,
      'RETAILER_ID': retailerId,
      'LEAD_CONVERTED_DATE': leadConvertedDate,
      'LEAD_CREATION_DATE': leadCreationDate,
      'SPECIAL_INCENTIVE': specialIncentive,
      'SITE_VISIT': siteVisit,
      'PRODUCT_SOLD': productSold,
      'PAINTER_AUTO_CONVERSION': painterAutoConversion,
      'DELIVERED_YN': deliveredYn,
      'PROCESSED_YN': processedYn,
      'REFERED_TO_POD': referredToPod,
      'RETAILER_NAME': retailerName,
      'CITY_ID': cityId,
      'CITY_NAME': cityName,
      'LEAD_TYPE': leadType,
      'REFERED_BY_SALES_ID': referredBySalesId,
      'LEAD_REFERAL': leadReferral,
      'LEAD_SOURCE': leadSource,
    };
  }
}
