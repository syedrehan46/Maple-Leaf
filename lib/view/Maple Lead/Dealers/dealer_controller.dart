import 'package:get/get.dart';

class DealerController extends GetxController {
  RxList<String> cities = [
    'B - KARACHI',
    'BOLHARI',
    'BULRI SHAH KARIM',
    'CHACHRO',
    'GOLARCHI',
    'HUB CHOWKI',
    'ISLAMKOT',
    'JAMSHORO',
    'JHUDDO',
    'KARACHI',
    'KUNRI',
  ].obs;

  RxList<String> dealers = [
    'Dealer',
    'Distributor',

  ].obs;

  var selectedCity = ''.obs;
  var selectedDealer = ''.obs;

  void refreshData() {
    selectedCity.value = '';
    selectedDealer.value = '';
    // You can also re-fetch cities/dealers here if needed
    // Example:
    // fetchCities();
    // fetchDealers();
  }
}
