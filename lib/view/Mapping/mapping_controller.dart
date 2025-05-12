import 'package:get/get.dart';

class MappingController extends GetxController {
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

  RxList<String> dealers = ['Ayesha Khan',
    'Ali Malik',
    'Sara Shahid',
    'Bilal Ahmed',
    'Fatima Ali',
    'Usman Shah',
    'Hina Tariq',
    'Imran Farooq',
    'Zainab Butt',
    'Ahmed Raza',
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
