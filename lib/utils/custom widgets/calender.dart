import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:mapleleaf/utils/app_colors.dart';

Future<void> showCustomDatePicker({
  required BuildContext context,
  required Function(DateTime) onDateSelected,
  DateTime? initialDate,
}) async {
  List<DateTime?> selectedDates = [initialDate ?? DateTime.now()];

  await showDialog(
    context: context,
    builder: (ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.all(16),
        child: StatefulBuilder(
          builder: (context, setState) {
            final selected = selectedDates.first ?? DateTime.now();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Red Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${selected.year}',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 4),
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

                // Calendar Picker
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.single,
                      selectedDayHighlightColor: AppColors.primaryColor,
                      centerAlignModePicker: true,
                      disableModePicker: true,
                      weekdayLabelTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      dayTextStyle: const TextStyle(color: Colors.black),
                      selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      controlsTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      dayBorderRadius: BorderRadius.circular(100),
                    ),
                    value: selectedDates,
                    onValueChanged: (dates) {
                      setState(() => selectedDates = dates);
                    },
                  ),
                ),

                // OK / CANCEL Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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