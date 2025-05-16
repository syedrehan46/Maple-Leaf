import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
class MyController extends GetxController {
  RxString selectedSecondTypePerson = ''.obs;
  RxString selectedthirdTypePerson = ''.obs;
  RxString selectedSampleApplied = ''.obs;
  RxString selectedConvertedToSale = ''.obs;
  RxString selectedProjectToSale = ''.obs;
  RxString selectedPainterObliged = ''.obs;
  RxString selectCity = ''.obs;
  RxString selectArea = ''.obs;
  RxString selectDealerrType = ''.obs;
  RxString selectRecieptType = ''.obs;
  RxString selectMinor = ''.obs;
  RxString selectZone = ''.obs;


  RxList<String> secondTypePersonList = ['LABOR CONTRACTOR', 'SUB CONTRACTOR', 'PAINTER',"ARCHITECT","ATTENDENT"].obs;
  RxList<String> thirdTypePersonList =  ['LABOR CONTRACTOR', 'SUB CONTRACTOR', 'PAINTER',"ARCHITECT","ATTENDENT"].obs;
  RxList<String> selectedSampledList = ["YES","NO"].obs;
  RxList<String> selectedConvertedToSaleList =  ["YES","NO","IN PROCESS"].obs;
  RxList<String> selectedProjectToSaleList = ["PAINT NOT DUE (BRICK STAGE),","PLASTER IN PROGRESS","READY TO PAINT","PARTIALLY PAINTED","CEILING LEFT","PAINT COMPLETED"].obs;
  RxList<String> selectedPainterObligedList =  ["YES","NO"].obs;
  RxList<String> selectCityList =  ["B-KARACHI","BOLHARI","BULRI SAH KARIM","CHACHRO","GOLRACHI"].obs;
  RxList<String> selectAreaList =  ["B-KARACHI","BOLHARI","BULRI SAH KARIM","CHACHRO","GOLRACHI"].obs;
  RxList<String> selectDealerList =  ["Dealer","Distributor"].obs;
  RxList<String> selectRecieptTypeList=["Cheque","DD","Pay Order","Bank Reciept","Online Transaction","Cash At Bank"].obs;
  RxList<String> selectMinorList=["Minor","wfefh","jwehf"].obs;
  RxList<String> selectZoneList=["Islamabad","London ","New York"].obs;
}
