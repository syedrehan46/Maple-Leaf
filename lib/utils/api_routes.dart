class ApiRoutes{
  static const String liveUrl = "https://mlcf.kmlg.com:4050/api/";
  static const String testUrl = "http://192.168.1.7:8080/api/";
  static const String baseUrl = liveUrl;
  static const String apiLogin = "User/isValiduser";
  static const String apiLogout = "auth/logout";
  static const String apiUpdateCredential = "User/UpdateCredential";
  static const String apiVerifyPassword = "User/VerifyEmployeeInfoForPasswordChange";
  static const String apiChangePassword = "User/ChangePasswordAfterVerification";
  static const String apiSendOtp = "auth/send-otp";
  static const String apiSignUp = "auth/user";
  static const String apiFeedBack = "feedback";
  static const String apiAboutUs = "aboutus";
  static const String apiInverterList = "warranties";
  static const String apiComplaintsList = "complaints";
  static const String apiComplaintsDetailList = "complaints/";
  static const String apiCustomerApproved = "complaint/customer-approved";
  static const String apiInverterModelsList = "inverters";
  static const String apiAddWarranty = "warranties";
  static const String apiServiceCenters = "service-centers";
  static const String apiCityCenters = "auth/servicecenters";
  static const String apiNotifications = "notifications";
  static const String apiGetProfile = "user/";
  static const String apiUpdateProfile = "user/";
  static const String apiAccountDelete = "user/";
  static const String apiAddLead = "Opa/AddLeadDetail";
}