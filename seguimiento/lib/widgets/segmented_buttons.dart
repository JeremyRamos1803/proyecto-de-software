import 'package:flutter/material.dart';

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({Key? key}) : super(key: key);

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  Calendar calendarView = Calendar.week;
  Currency selectedCurrency = Currency.kg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SegmentedButton<Currency>(
                style: SegmentedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.red,
                  selectedForegroundColor: Colors.white,
                  selectedBackgroundColor: Colors.green,
                ),
                segments: const <ButtonSegment<Currency>>[
                  ButtonSegment<Currency>(
                    value: Currency.kg,
                    label: Text('KG'),
                  ),
                  ButtonSegment<Currency>(
                    value: Currency.dollar,
                    label: Text('\$'),
                  ),
                ],
                selected: <Currency>{selectedCurrency},
                onSelectionChanged: (Set<Currency> newSelection) {
                  setState(() {
                    selectedCurrency = newSelection.first;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Espacio entre los botones
        SegmentedButton<Calendar>(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.red,
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: Colors.green,
          ),
          segments: const <ButtonSegment<Calendar>>[
            ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
                icon: Icon(Icons.calendar_view_week)),
            ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
                icon: Icon(Icons.calendar_view_month)),
            ButtonSegment<Calendar>(
                value: Calendar.year,
                label: Text('Year'),
                icon: Icon(Icons.calendar_today)),
          ],
          selected: <Calendar>{calendarView},
          onSelectionChanged: (Set<Calendar> newSelection) {
            setState(() {
              calendarView = newSelection.first;
            });
          },
        ),
      ],
    );
  }
}

enum Calendar { day, week, month, year }
enum Currency { kg, dollar }
