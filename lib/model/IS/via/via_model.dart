class ViaModel {
  final int viaId;
  final String viaDescription;
  final String app;
  final String th;
  final String vendor;
  final String createdOn;
  final String createdBy;
  final String? updatedOn;
  final String? updatedBy;
  final String b2b;
  final double sorting;
  final String b2bHead;
  final String painterRepresentative;

  ViaModel({
    required this.viaId,
    required this.viaDescription,
    required this.app,
    required this.th,
    required this.vendor,
    required this.createdOn,
    required this.createdBy,
    this.updatedOn,
    this.updatedBy,
    required this.b2b,
    required this.sorting,
    required this.b2bHead,
    required this.painterRepresentative,
  });

  factory ViaModel.fromJson(Map<String, dynamic> json) {
    return ViaModel(
      viaId: (json['VIA_ID'] as num).toInt(),
      viaDescription: json['VIA_DESCRIPTION'] ?? '',
      app: json['APP'] ?? '',
      th: json['TH'] ?? '',
      vendor: json['VENDOR'] ?? '',
      createdOn: json['CREATED_ON'] ?? '',
      createdBy: json['CREATED_BY'] ?? '',
      updatedOn: json['UPDATED_ON'],
      updatedBy: json['UPDATED_BY'],
      b2b: json['B2B'] ?? '',
      sorting: (json['SORTING'] as num).toDouble(),
      b2bHead: json['B2B_HEAD'] ?? '',
      painterRepresentative: json['PAINTER_REPRESENTATIVE'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VIA_ID': viaId,
      'VIA_DESCRIPTION': viaDescription,
      'APP': app,
      'TH': th,
      'VENDOR': vendor,
      'CREATED_ON': createdOn,
      'CREATED_BY': createdBy,
      'UPDATED_ON': updatedOn,
      'UPDATED_BY': updatedBy,
      'B2B': b2b,
      'SORTING': sorting,
      'B2B_HEAD': b2bHead,
      'PAINTER_REPRESENTATIVE': painterRepresentative,
    };
  }
}
