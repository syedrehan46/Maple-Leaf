class SalesOfficerModel {
  String? partyCode;
  String? associatedProduct;
  String? productName;
  String? partyName;
  dynamic id;
  dynamic shopCapacity;
  dynamic salesTarget;
  dynamic retailerId;
  String? retailerCode;
  String? personName;
  String? retailerName;
  double? zoneId;
  String? zoneCode;
  String? zoneDesc;
  dynamic cityId;
  String? cityCode;
  int? cityID;
  dynamic defaultWarehouseId;
  String? cityDesc;
  String? cityName;
  dynamic regionalHeadId;
  String? regionalHead;
  dynamic salesOfficerId;
  String? salesForceId;
  String? salesOfficerName;
  dynamic phaseId;
  dynamic statusId;
  dynamic latitude;
  dynamic longitude;
  String? locationName;
  String? address;
  String? status;
  String? lastUpdatedOn;
  String? shopName;
  String? phone1;
  String? phone2;
  double? cityNo;
  String? createdOn;
  String? bankName;
  String? accountNo;
  String? bankName2;
  String? accountNo2;
  String? cardNumber;
  String? cnic;
  String? dob;
  String? dob1;
  String? qrCode;
  String? type;
  String? salesOfficerMobileNo;
  dynamic wallPuttyCapacity;
  String? wallPuttyUom;
  dynamic wallCoatCapacity;
  String? wallCoatUom;
  dynamic whiteCapacity;
  String? whiteUom;
  dynamic areaId;
  String? cuttOfDate;

  SalesOfficerModel({
    this.partyCode,
    this.associatedProduct,
    this.productName,
    this.partyName,
    this.id,
    this.shopCapacity,
    this.salesTarget,
    this.retailerId,
    this.retailerCode,
    this.personName,
    this.retailerName,
    this.zoneId,
    this.zoneCode,
    this.zoneDesc,
    this.cityId,
    this.cityCode,
    this.cityID,
    this.defaultWarehouseId,
    this.cityDesc,
    this.cityName,
    this.regionalHeadId,
    this.regionalHead,
    this.salesOfficerId,
    this.salesForceId,
    this.salesOfficerName,
    this.phaseId,
    this.statusId,
    this.latitude,
    this.longitude,
    this.locationName,
    this.address,
    this.status,
    this.lastUpdatedOn,
    this.shopName,
    this.phone1,
    this.phone2,
    this.cityNo,
    this.createdOn,
    this.bankName,
    this.accountNo,
    this.bankName2,
    this.accountNo2,
    this.cardNumber,
    this.cnic,
    this.dob,
    this.dob1,
    this.qrCode,
    this.type,
    this.salesOfficerMobileNo,
    this.wallPuttyCapacity,
    this.wallPuttyUom,
    this.wallCoatCapacity,
    this.wallCoatUom,
    this.whiteCapacity,
    this.whiteUom,
    this.areaId,
    this.cuttOfDate,
  });

  factory SalesOfficerModel.fromJson(Map<String, dynamic> json) {
    return SalesOfficerModel(
      partyCode: json['PARTY_CODE'],
      associatedProduct: json['ASSOCIATED_PRODUCT'],
      productName: json['PRODUCT_NAME'],
      partyName: json['PARTY_NAME'],
      id: json['ID'],
      shopCapacity: json['SHOP_CAPACITY'],
      salesTarget: json['SALES_TARGET'],
      retailerId: json['RETAILER_ID'],
      retailerCode: json['RETAILER_CODE'],
      personName: json['PERSONNAME'],
      retailerName: json['RETAILER_NAME'],
      zoneId: (json['ZONE_ID'] as num?)?.toDouble(),
      zoneCode: json['ZONE_CODE'],
      zoneDesc: json['ZONE_DESC'],
      cityId: json['CITY_ID'],
      cityCode: json['CITY_CODE'],
      cityID: json['CITYID'],
      defaultWarehouseId: json['DEFAULT_WAREHOUSE_ID'],
      cityDesc: json['CITY_DESC'],
      cityName: json['CITY_NAME'],
      regionalHeadId: json['REGIONAL_HEAD_ID'],
      regionalHead: json['REGIONAL_HEAD'],
      salesOfficerId: json['SALES_OFFICER_ID'],
      salesForceId: json['SALES_FORCE_ID'],
      salesOfficerName: json['SALES_OFFICER_NAME'],
      phaseId: json['PHASE_ID'],
      statusId: json['STATUS_ID'],
      latitude: json['LATITUDE'],
      longitude: json['LONGITUDE'],
      locationName: json['LOCATION_NAME'],
      address: json['ADDRESS'],
      status: json['STATUS'],
      lastUpdatedOn: json['LAST_UPDATED_ON'],
      shopName: json['SHOP_NAME'],
      phone1: json['PHONE1'],
      phone2: json['PHONE2'],
      cityNo: (json['CITY_NO'] as num?)?.toDouble(),
      createdOn: json['CREATED_ON'],
      bankName: json['BANKNAME'],
      accountNo: json['ACCOUNTNO'],
      bankName2: json['BANKNAME2'],
      accountNo2: json['ACCOUNTNO2'],
      cardNumber: json['CARD_NUMBER'],
      cnic: json['CNIC'],
      dob: json['DOB'],
      dob1: json['DOB1'],
      qrCode: json['QRCODE'],
      type: json['TYPE'],
      salesOfficerMobileNo: json['SALES_OFFICER_MOBILE_NO'],
      wallPuttyCapacity: json['WALLPUTTY_CAPACITY'],
      wallPuttyUom: json['WALLPUTTY_UOM'],
      wallCoatCapacity: json['WALLCOAT_CAPACITY'],
      wallCoatUom: json['WALLCOAT_UOM'],
      whiteCapacity: json['WHITE_CAPACITY'],
      whiteUom: json['WHITE_UOM'],
      areaId: json['AREAID'],
      cuttOfDate: json['CUTT_OF_DATE'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PARTY_CODE': partyCode,
      'ASSOCIATED_PRODUCT': associatedProduct,
      'PRODUCT_NAME': productName,
      'PARTY_NAME': partyName,
      'ID': id,
      'SHOP_CAPACITY': shopCapacity,
      'SALES_TARGET': salesTarget,
      'RETAILER_ID': retailerId,
      'RETAILER_CODE': retailerCode,
      'PERSONNAME': personName,
      'RETAILER_NAME': retailerName,
      'ZONE_ID': zoneId,
      'ZONE_CODE': zoneCode,
      'ZONE_DESC': zoneDesc,
      'CITY_ID': cityId,
      'CITY_CODE': cityCode,
      'CITYID': cityID,
      'DEFAULT_WAREHOUSE_ID': defaultWarehouseId,
      'CITY_DESC': cityDesc,
      'CITY_NAME': cityName,
      'REGIONAL_HEAD_ID': regionalHeadId,
      'REGIONAL_HEAD': regionalHead,
      'SALES_OFFICER_ID': salesOfficerId,
      'SALES_FORCE_ID': salesForceId,
      'SALES_OFFICER_NAME': salesOfficerName,
      'PHASE_ID': phaseId,
      'STATUS_ID': statusId,
      'LATITUDE': latitude,
      'LONGITUDE': longitude,
      'LOCATION_NAME': locationName,
      'ADDRESS': address,
      'STATUS': status,
      'LAST_UPDATED_ON': lastUpdatedOn,
      'SHOP_NAME': shopName,
      'PHONE1': phone1,
      'PHONE2': phone2,
      'CITY_NO': cityNo,
      'CREATED_ON': createdOn,
      'BANKNAME': bankName,
      'ACCOUNTNO': accountNo,
      'BANKNAME2': bankName2,
      'ACCOUNTNO2': accountNo2,
      'CARD_NUMBER': cardNumber,
      'CNIC': cnic,
      'DOB': dob,
      'DOB1': dob1,
      'QRCODE': qrCode,
      'TYPE': type,
      'SALES_OFFICER_MOBILE_NO': salesOfficerMobileNo,
      'WALLPUTTY_CAPACITY': wallPuttyCapacity,
      'WALLPUTTY_UOM': wallPuttyUom,
      'WALLCOAT_CAPACITY': wallCoatCapacity,
      'WALLCOAT_UOM': wallCoatUom,
      'WHITE_CAPACITY': whiteCapacity,
      'WHITE_UOM': whiteUom,
      'AREAID': areaId,
      'CUTT_OF_DATE': cuttOfDate,
    };
  }
}
