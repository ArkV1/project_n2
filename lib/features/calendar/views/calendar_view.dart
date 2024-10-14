import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_widget.dart';
import 'package:project_n2/features/calendar/widgets/calendar_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarWidgets = ref.watch(appWidgetByParentIdProvider(parentId: 'calendarScreen'));

    return calendarWidgets.when(
      data: (widgets) {
        return Column(
          children: [
            for (var widget in widgets)
              CalendarWidgetBuilder(
                appWidget: widget,
              ),
            // TODO: Add a button to add new calendar widgets
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
