class ApiRoutes{
  static const String liveUrl = "https://anicsun.viion.net/api/";
  static const String testUrl = "http://192.168.1.7:8080/api/";
  static const String baseUrl = liveUrl;

  static const String apiLogin = "auth/login";
  static const String apiLogout = "auth/logout";
  static const String apiForgotPassword = "auth/forget-password";
  static const String apiVerifyOtp = "auth/verify-otp";
  static const String apiResetPassword = "auth/reset-password";
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

}