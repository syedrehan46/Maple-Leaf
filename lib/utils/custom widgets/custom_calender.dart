import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:mapleleaf/utils/app_colors.dart';
Future<void> showCustomDatePicker({
  required BuildContext context,
  required Function(DateTime) onDateSelected,
  DateTime? initialDate,
}) async {
  List<DateTime?> selectedDates = [initialDate ?? DateTime.now()];
  bool isYearPickerVisible = false;
  List<int> yearList = List.generate(100, (index) => 2015 + index);
  await showDialog(
    context: context,
    builder: (ctx) {
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0), // Rounded only top corners
            bottom: Radius.circular(0), // No bottom radius
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            final selected = selectedDates.first ?? DateTime.now();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Red Header
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isYearPickerVisible = !isYearPickerVisible;
                          });
                        },
                        child: Text(
                          '${selected.year}',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Text(
                        _formatFullDate(selected),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Conditional view: Year picker or calendar
                SizedBox(
                  height: 320, // Fixed height for both year picker and calendar
                  child: isYearPickerVisible
                      ? ListView.builder(
                    controller: ScrollController(
                      initialScrollOffset: yearList.indexOf(selected.year) * 56.0 - 112.0, // Center the selected year
                    ),
                    itemCount: yearList.length,
                    itemBuilder: (context, index) {
                      final year = yearList[index];
                      final isSelected = year == selected.year;
                      return ListTile(
                        title: Center(
                          child: Text(
                            '$year',
                            style: TextStyle(
                              fontSize: isSelected ? 22 : 18, // Bigger font for selected year
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        onTap: () {
                          final updated = DateTime(
                            year,
                            selected.month,
                            selected.day,
                          );
                          setState(() {
                            selectedDates = [updated];
                            isYearPickerVisible = false;
                          });
                        },
                      );
                    },
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.single,
                        selectedDayHighlightColor: AppColors.primaryColor,
                        centerAlignModePicker: true,
                        daySplashColor: Colors.transparent,
                        disableModePicker: true,
                        weekdayLabelTextStyle: const TextStyle(color: AppColors.grey8E8E8EColor, fontWeight: FontWeight.w600),
                        dayTextStyle: const TextStyle(color: Colors.black),
                        selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        controlsTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                        controlsHeight: 30,
                        monthTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                        yearTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      value: selectedDates,
                      onValueChanged: (dates) {
                        setState(() => selectedDates = dates);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // OK / CANCEL Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (selectedDates.first != null) {
                            onDateSelected(selectedDates.first!);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
String _formatFullDate(DateTime date) {
  const weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  const months = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  final weekday = weekdays[date.weekday % 7];
  final month = months[date.month];
  return '$weekday, $month ${date.day}';
}