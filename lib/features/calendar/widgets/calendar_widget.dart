import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class CalendarWidgetBuilder extends ConsumerStatefulWidget {
  final AppWidget appWidget;

  const CalendarWidgetBuilder({
    Key? key,
    required this.appWidget,
  }) : super(key: key);

  @override
  ConsumerState<CalendarWidgetBuilder> createState() => _CalendarWidgetBuilderState();
}

class _CalendarWidgetBuilderState extends ConsumerState<CalendarWidgetBuilder> {
  // DateTime _selectedDay = DateTime.now();

  Widget _buildMonthView() {
    return Text('Month View - Not implemented yet');
    // TableCalendar(
    //       firstDay: DateTime.utc(2010, 10, 16),
    //       lastDay: DateTime.utc(2030, 3, 14),
    //       focusedDay: _focusedDay,
    //       calendarFormat: _calendarFormat,
    //       selectedDayPredicate: (day) {
    //         return isSameDay(_selectedDay, day);
    //       },
    //       onDaySelected: (selectedDay, focusedDay) {
    //         if (!isSameDay(selectedDay, selectedDay)) {
    //           setState(() {
    //             selectedDay = selectedDay;
    //             focusedDay = focusedDay;
    //           });
    //         }
    //       },
    //       onFormatChanged: (format) {
    //         if (_calendarFormat != format) {
    //           setState(() {
    //             _calendarFormat = format;
    //           });
    //         }
    //       },
    //       onPageChanged: (focusedDay) {
    //         _focusedDay = focusedDay;
    //       },
    //     );
  }

  Widget _buildWeekView() {
    // Implement week view
    return Text('Week View - Not implemented yet');
  }

  Widget _buildDayView() {
    // Implement day view
    return Text('Day View - Not implemented yet');
  }

  @override
  Widget build(BuildContext context) {
    final widgetType = widget.appWidget.widgetType as CalendarWidgetType;

    switch (widgetType) {
      case CalendarWidgetType.monthView:
        return _buildMonthView();
      case CalendarWidgetType.weekView:
        return _buildWeekView();
      case CalendarWidgetType.dayView:
        return _buildDayView();
      default:
        return Text('Unknown calendar widget type: $widgetType');
    }
  }
}
