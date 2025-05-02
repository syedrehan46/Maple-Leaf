import 'dart:convert';

class LoginModel {
  User? user;
  String? message;
  String? success;
  int? empNo;

  LoginModel({
    this.user,
    this.message,
    this.success,
    this.empNo,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    user: json["User"] == null ? null : User.fromJson(json["User"]),
    message: json["Message"],
    success: json["Success"],
    empNo: json["EmpNo"],
  );

  Map<String, dynamic> toJson() => {
    "User": user?.toJson(),
    "Message": message,
    "Success": success,
    "EmpNo": empNo,
  };
}

class User {
  String? salesForceId;
  String? username;
  String? password;
  String? empNo;
  String? isGreySalesOfficer;
  String? isWhiteSalesOfficer;
  dynamic regionalHeadId;
  dynamic regionalHeadSalesId;
  dynamic refSalesofficerid;
  String? employeeName;
  String? permanentContractual;
  String? remarks;
  dynamic dataFor;
  dynamic lastLoggedIn;

  User({
    this.salesForceId,
    this.username,
    this.password,
    this.empNo,
    this.isGreySalesOfficer,
    this.isWhiteSalesOfficer,
    this.regionalHeadId,
    this.regionalHeadSalesId,
    this.refSalesofficerid,
    this.employeeName,
    this.permanentContractual,
    this.remarks,
    this.dataFor,
    this.lastLoggedIn,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    salesForceId: json["SalesForceId"],
    username: json["Username"],
    password: json["Password"],
    empNo: json["EmpNo"],
    isGreySalesOfficer: json["IsGreySalesOfficer"],
    isWhiteSalesOfficer: json["IsWhiteSalesOfficer"],
    regionalHeadId: json["RegionalHeadId"],
    regionalHeadSalesId: json["RegionalHeadSalesId"],
    refSalesofficerid: json["REF_SALESOFFICERID"],
    employeeName: json["EMPLOYEE_NAME"],
    permanentContractual: json["PERMANENT_CONTRACTUAL"],
    remarks: json["REMARKS"],
    dataFor: json["DATA_FOR"],
    lastLoggedIn: json["LAST_LOGGED_IN"],
  );

  Map<String, dynamic> toJson() => {
    "SalesForceId": salesForceId,
    "Username": username,
    "Password": password,
    "EmpNo": empNo,
    "IsGreySalesOfficer": isGreySalesOfficer,
    "IsWhiteSalesOfficer": isWhiteSalesOfficer,
    "RegionalHeadId": regionalHeadId,
    "RegionalHeadSalesId": regionalHeadSalesId,
    "REF_SALESOFFICERID": refSalesofficerid,
    "EMPLOYEE_NAME": employeeName,
    "PERMANENT_CONTRACTUAL": permanentContractual,
    "REMARKS": remarks,
    "DATA_FOR": dataFor,
    "LAST_LOGGED_IN": lastLoggedIn,
  };
}
