

class FeedbackModel {
  // Painter Information (May come from painter selection screen)
  String painterPhone;
  String painterName;
  bool painterConversion;

  // Customer Information (May come from customer input screen)
  String customerContactNo;
  String customerNameAndAddress;

  // Shop Information (May come from shop selection screen)
  String shopName;

  // Visit Details (May come from visit details screen)
  bool siteVisit;
  bool productSold;
  bool sampleApplied;
  bool convertedToSale;
  bool specialIncentives;

  // Product Information (May come from expected sales screen)
  String expectedKgs;

  // Actual Sales Details (Entered in feedback screen)
  int bagsOf5KgPutty;
  int bagsOf20KgPutty;
  int bagsOf20KgRegular;
  int totalKgsOf5KgPutty;
  int totalKgsOf20KgPutty;
  int totalKgsOf20KgRegular;
  int totalKgs;

  // Constructor with default values for optional fields
  FeedbackModel({
    this.painterPhone = '',
    this.painterName = '',
    this.customerContactNo = '',
    this.customerNameAndAddress = '',
    this.shopName = '',
    this.painterConversion = false,
    this.siteVisit = false,
    this.productSold = false,
    this.sampleApplied = false,
    this.convertedToSale = false,
    this.specialIncentives = false,
    this.expectedKgs = '',
    this.bagsOf5KgPutty = 0,
    this.bagsOf20KgPutty = 0,
    this.bagsOf20KgRegular = 0,
    this.totalKgsOf5KgPutty = 0,
    this.totalKgsOf20KgPutty = 0,
    this.totalKgsOf20KgRegular = 0,
    this.totalKgs = 0,
  });

  // Factory constructor to create a model from a map (JSON)
  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      painterPhone: json['painterPhone'] ?? '',
      painterName: json['painterName'] ?? '',
      customerContactNo: json['customerContactNo'] ?? '',
      customerNameAndAddress: json['customerNameAndAddress'] ?? '',
      shopName: json['shopName'] ?? '',
      painterConversion: _parseBoolValue(json['painterConversion']),
      siteVisit: _parseBoolValue(json['siteVisit']),
      productSold: _parseBoolValue(json['productSold']),
      sampleApplied: _parseBoolValue(json['sampleApplied']),
      convertedToSale: _parseBoolValue(json['convertedToSale']),
      specialIncentives: _parseBoolValue(json['specialIncentives']),
      expectedKgs: json['expectedKgs'] ?? '',
      bagsOf5KgPutty: json['bagsOf5KgPutty'] ?? 0,
      bagsOf20KgPutty: json['bagsOf20KgPutty'] ?? 0,
      bagsOf20KgRegular: json['bagsOf20KgRegular'] ?? 0,
      totalKgsOf5KgPutty: json['totalKgsOf5KgPutty'] ?? 0,
      totalKgsOf20KgPutty: json['totalKgsOf20KgPutty'] ?? 0,
      totalKgsOf20KgRegular: json['totalKgsOf20KgRegular'] ?? 0,
      totalKgs: json['totalKgs'] ?? 0,
    );
  }

  // Convert model to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'painterPhone': painterPhone,
      'painterName': painterName,
      'customerContactNo': customerContactNo,
      'customerNameAndAddress': customerNameAndAddress,
      'shopName': shopName,
      'painterConversion': _formatBoolToYesNo(painterConversion),
      'siteVisit': _formatBoolToYesNo(siteVisit),
      'productSold': _formatBoolToYesNo(productSold),
      'sampleApplied': _formatBoolToYesNo(sampleApplied),
      'convertedToSale': _formatBoolToYesNo(convertedToSale),
      'specialIncentives': _formatBoolToYesNo(specialIncentives),
      'expectedKgs': expectedKgs,
      'bagsOf5KgPutty': bagsOf5KgPutty,
      'bagsOf20KgPutty': bagsOf20KgPutty,
      'bagsOf20KgRegular': bagsOf20KgRegular,
      'totalKgsOf5KgPutty': totalKgsOf5KgPutty,
      'totalKgsOf20KgPutty': totalKgsOf20KgPutty,
      'totalKgsOf20KgRegular': totalKgsOf20KgRegular,
      'totalKgs': totalKgs,
    };
  }

  // Helper method to convert YES/NO strings to boolean
  static bool _parseBoolValue(dynamic value) {
    if (value is bool) return value;
    if (value is String) {
      return value.toUpperCase() == 'YES';
    }
    return false;
  }

  // Helper method to convert boolean to YES/NO
  static String _formatBoolToYesNo(bool value) {
    return value ? 'YES' : 'NO';
  }

  // Calculate KG totals based on bag quantities
  void calculateTotals() {
    totalKgsOf5KgPutty = bagsOf5KgPutty * 5;
    totalKgsOf20KgPutty = bagsOf20KgPutty * 20;
    totalKgsOf20KgRegular = bagsOf20KgRegular * 20;
    totalKgs = totalKgsOf5KgPutty + totalKgsOf20KgPutty + totalKgsOf20KgRegular;
  }

  // Create a copy with updated values
  FeedbackModel copyWith({
    String? painterPhone,
    String? painterName,
    String? customerContactNo,
    String? customerNameAndAddress,
    String? shopName,
    bool? painterConversion,
    bool? siteVisit,
    bool? productSold,
    bool? sampleApplied,
    bool? convertedToSale,
    bool? specialIncentives,
    String? expectedKgs,
    int? bagsOf5KgPutty,
    int? bagsOf20KgPutty,
    int? bagsOf20KgRegular,
    int? totalKgsOf5KgPutty,
    int? totalKgsOf20KgPutty,
    int? totalKgsOf20KgRegular,
    int? totalKgs,
  }) {
    return FeedbackModel(
      painterPhone: painterPhone ?? this.painterPhone,
      painterName: painterName ?? this.painterName,
      customerContactNo: customerContactNo ?? this.customerContactNo,
      customerNameAndAddress: customerNameAndAddress ?? this.customerNameAndAddress,
      shopName: shopName ?? this.shopName,
      painterConversion: painterConversion ?? this.painterConversion,
      siteVisit: siteVisit ?? this.siteVisit,
      productSold: productSold ?? this.productSold,
      sampleApplied: sampleApplied ?? this.sampleApplied,
      convertedToSale: convertedToSale ?? this.convertedToSale,
      specialIncentives: specialIncentives ?? this.specialIncentives,
      expectedKgs: expectedKgs ?? this.expectedKgs,
      bagsOf5KgPutty: bagsOf5KgPutty ?? this.bagsOf5KgPutty,
      bagsOf20KgPutty: bagsOf20KgPutty ?? this.bagsOf20KgPutty,
      bagsOf20KgRegular: bagsOf20KgRegular ?? this.bagsOf20KgRegular,
      totalKgsOf5KgPutty: totalKgsOf5KgPutty ?? this.totalKgsOf5KgPutty,
      totalKgsOf20KgPutty: totalKgsOf20KgPutty ?? this.totalKgsOf20KgPutty,
      totalKgsOf20KgRegular: totalKgsOf20KgRegular ?? this.totalKgsOf20KgRegular,
      totalKgs: totalKgs ?? this.totalKgs,
    );
  }
}