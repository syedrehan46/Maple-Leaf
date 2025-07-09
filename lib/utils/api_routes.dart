class ApiRoutes{
  static const String liveUrl = "https://mlcf.kmlg.com:4050/api/";
  static const String testUrl = "http://192.168.1.7:8080/api/";
  static const String baseUrl = liveUrl;
  static const String apiLogin = "User/isValiduser";
  static const String apiLogout = "auth/logout";
  static const String apiUpdateCredential = "User/UpdateCredential";
  static const String apiVerifyPassword = "User/VerifyEmployeeInfoForPasswordChange";
  static const String apiChangePassword = "User/ChangePasswordAfterVerification";
  static const String apiIsPlanDetailAreaWise = "$baseUrl/Leads/GetAreasWiseUserPlanning";
  static const String apiIsPlanDetailFiltersWise = "$baseUrl/Leads/GetPlanningFiltersByCityAndMonthly";
  static const String apiIsPlanDetailCityWise = "$baseUrl/Leads/GetCityWiseUserPlanning";
  static const String apiIsPlanDetailFilterWise = "$baseUrl/Leads/GetPlanningFiltersByCityAndMonthly";
  static const String apiIsAllCities = "$baseUrl/Common/GetCitiesByUserLm";
  static const String apiIsGetAreaByUserLm = "$baseUrl/Common/GetAreasByUserLm";
  static const String apiIsGetAreaByForReferal = "$baseUrl/Common/GetAllAreasForReferal";
  static const String apiIsGetFosReferal = "$baseUrl/Leads/GetSalesForceByAreaForReferal";
  static const String apiIsGetVia = "$baseUrl/Leads/GetViaDetailForFos";
  static const String apiIsGetViaB2B = "$baseUrl/Leads/GetViaDetailForB2B";
  static const String apiIsGetViaPainterRepresentative = "$baseUrl/Leads/GetViaDetailForPainterRepresentative";
  static const String apiIsGetRetailer = "$baseUrl/Leads/GetRetailersBySalesForceIdForFosV1";
  static const String apiIsGetRetailerByCities = "$baseUrl/Leads/GetRetailerByCities";
  static const String apiIsGetAlGiftForMkt = "$baseUrl/Leads/GetGiftsOfMKT";
   //LEad Converted
  static const String apiLmConvertedCityRecord= "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmConvertedTwoWeeks = "$baseUrl/Leads/GetTwoWeekLeaConvertedDetailV1";
  static const String apiLmConvertedLastThirtyDays = "$baseUrl/Leads/LastThirtyDaysLeadConvertedDetailV1l";
  static const String apiLmConvertedLastMonth= "$baseUrl/Leads/SinceLastMonthLeadConvertedDetailV1";
  static const String apiLmConvertedLastTwoMonth= "$baseUrl/Leads/SinceLastTwoMonthLeadConvertedDetailV1";
  static const String apiLmConvertedLeadStatus= "$baseUrl/LeadEngine/GetLeadStatus";
  static const String apiLmConvertedFilterAllCities= "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmConvertedFilteredConverted= "$baseUrl/Leads/GetAllLeadConvertedByMonthTypeV1";
  //Lead Processing
  static const String apiLmProcessingCityDetail= "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmProcessingTwoWeeks = "$baseUrl/Leads/GetTwoWeekLeadCovnertedProcessedandNotProcessedV1";
  static const String apiLmProcessingLastThirtyDays = "$baseUrl/Leads/LastThirtyDaysLeadCovnertedProcessedandNotProcessedV1";
  static const String apiLmProcessingLastMonth= "$baseUrl/Leads/SinceLastMonthLeadCovnertedProcessedandNotProcessedV1";
  static const String  apiLmProcessingLastTwoMonth= "$baseUrl/Leads/SinceLastTwoMonthLeadCovnertedProcessedandNotProcessedV1";
  static const String apiLmProcessingFiltersCity= "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmProcessingFilterStatus = "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmProcessingFilteredProcessed= "$baseUrl/LeadEngine/GetAllLeadProcessedByMonthTypeV1";
  static const String apiLmProcessingLeadProcessed= "$baseUrl/LeadEngine/GetLeadProcessed";
  //Lead Generated
  static const String apiLmCityList = "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmGeneratedTwoWeeks = "$baseUrl/LeadEngine/GetTwoWeekLeadGeneratedDetailV1";
  static const String apiLmGeneratedLastThirtyDays = "$baseUrl/LeadEngine/LastThirtyDaysLeadGeneratedDetail";
  static const String apiLmGeneratedLastMonth= "$baseUrl/LeadEngine/SinceLastMonthLeadGeneratedDetail";
  static const String apiLmGeneratedLastTwoMonth= "$baseUrl/LeadEngine/SinceLastTwoMonthLeadGeneratedDetail";
  static const String apiLmGeneratedFiltersCity= "$baseUrl/LeadEngine/GetAllCitiesByLeadManager";
  static const String apiLmGeneratedFilterStatus = "$baseUrl/LeadEngine/GetLeadStatus";
  static const String apiLmGeneratedLeadGenertedByMonyhType = "$baseUrl/LeadEngine/GetAllLeadGeneratedByMonthType";
  static const String apiLmPorfolioFormRetailerByUser = "$baseUrl/LeadEngine/GetRetailerByUser";
  static const String apiLmPorfolioFormRetailerStockes = "$baseUrl/LeadEngine/GetRetailerStock";
  static const String apiLmPorfolioFormProductSold = "$baseUrl/LeadEngine/GetProductSold";
  static const String apiLmPorfolioFormLeadProcessed = "$baseUrl/LeadEngine/GetLeadProcessed";
  //Individual Painter
  static const String apiEngamentPlanDetail = "$baseUrl/LeadEngine/GetEngagementPlanDetail";
  static const String apiEngamentPlanDetailLabor = "$baseUrl/LeadEngine/GetEngagementPlanDetail";
  static const String apiAllPainterDetail = "$baseUrl/LeadEngine/GetAllLaborContractorDetail";
  static const String apiAllPainterHeader = "https://mlcf.kmlg.com:4050/api/LeadEngine/GetPlanHeaderForIndividualPainters";


  // new painter induction
  static const String apiNewPainterInduction = "$baseUrl/LeadEngine/GetAllNewPainterDetailsForAlotingCards";


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

  //FEEDBACK POST API
  // static const String apiAddLead = "Opa/AddLeadDetail";
  // static const String apiAddLead = "Opa/AddLeadDetail";
  static const String apiFeedbackForm = "$baseUrl/LeadEngine/AddLeadFeedback";
  static const String apiCardNumberDetail = "$baseUrl/LeadEngine/AddCardNumberWithPainter";

  //IM MODULE
  static const String  apiImAddLead = "$baseUrl/LeadEngine/LeadAssociateWithPainter";
  static const String  apiImAddPlan= "$baseUrl/LeadEngine/AddPlanDetail";
  static const String  apiImAddPainter = "$baseUrl/LeadEngine/FinalisedEngagementGroupV1";
  static const String  apiImAllArea= "$baseUrl/LeadEngine/GetAreas";
  static const String  apiImArchitectDetail="$baseUrl/LeadEngine/GetAllArchitectAndBuilderDetail";

  // LM POST APIS
  static const String  apiLmGeneralCustomerUpdate= "$baseUrl/Leads/UpdateGeneralCustomer";
  static const String  apiLmFeedbackWithIntimationUpdate= "$baseUrl/Leads/LeadFeedBackAndIntimationD2CUpdated";

  /// todo: PE
  ///
  static const String apiEngagedPainter = "$baseUrl/LeadEngine/GetAllOldAndNewPaintersDetail";



}
