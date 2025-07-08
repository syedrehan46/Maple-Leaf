import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PainterDataController extends GetxController {
  var city = ''.obs;
  var area = ''.obs;
  var type = ''.obs;
  var location = ''.obs;
  var giveaway = ''.obs;
  var cardNumber = ''.obs;
  var phoneNumber = ''.obs;
  var painterName = ''.obs;
  RxString areaId = ''.obs;
  Rx<File?> attachmentImage = Rx<File?>(null);
  Rx<File?> painterAttachmentImage = Rx<File?>(null);

  // Add RxList to store meetup cards
  final RxList<MeetupModel> meetupCards = <MeetupModel>[].obs;

  // Track the currently selected card index
  final RxInt selectedCardIndex = RxInt(-1);

  // Track the selected meetup card object
  final Rx<MeetupModel?> selectedMeetupCard = Rx<MeetupModel?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize the meetup cards with sample data
    loadMeetupCards();
  }

  void loadMeetupCards() {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM').format(now);
    String upperCaseMonthName = monthName.toUpperCase();

    meetupCards.addAll([
      MeetupModel(
          city: "LAHORE",
          area: "LAHORE",
          achieved: 2,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "KOTLA",
          area: "KOTLA",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "CHARHOI",
          area: "CHARHOI",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "SARAI ALAMGIR",
          area: "SARAI ALAMGIR",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "KOTLA",
          area: "KOTLA",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "CHARHOI",
          area: "CHARHOI",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
      MeetupModel(
          city: "SARAI ALAMGIR",
          area: "SARAI ALAMGIR",
          achieved: 0,
          target: 5,
          weeklyFreq: 2,
          month: upperCaseMonthName
      ),
    ]);
  }

  // Method to update when a card is tapped with index and card data
  void updateSelectedCard(int index, MeetupModel card) {
    selectedCardIndex.value = index;
    selectedMeetupCard.value = card;
    // Store the city from the tapped card in the city parameter
    city.value = card.city;
    area.value = card.area;
    print("Selected city: ${city.value}"); // Debug print to verify
  }

  // Helper method to get selected city
  String getSelectedCity() {
    return city.value;
  }

  // Helper method to check if a specific card is selected
  bool isCardSelected(int index) {
    return selectedCardIndex.value == index;
  }
}

class MeetupModel {
  final String city;
  final String area;
  final int achieved;
  final int target;
  final int weeklyFreq;
  final String month;
  final String id; // Unique identifier for the meetup card
  MeetupModel({
    required this.city,
    required this.area,
    required this.achieved,
    required this.target,
    required this.weeklyFreq,
    required this.month,
    String? id, // Optional parameter
  }) : this.id = id ?? DateTime.now().millisecondsSinceEpoch.toString(); // Generate unique ID if not provided
  // Helper method to create a copy with modified fields
  MeetupModel copyWith({
    String? city,
    String? area,
    int? achieved,
    int? target,
    int? weeklyFreq,
    String? month,
  }) {
    return MeetupModel(
      city: city ?? this.city,
      area: area ?? this.area,
      achieved: achieved ?? this.achieved,
      target: target ?? this.target,
      weeklyFreq: weeklyFreq ?? this.weeklyFreq,
      month: month ?? this.month,
      id: this.id, // Preserve the original ID
    );
  }
}
