import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'calendar_event.freezed.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  CalendarEvent._();

  @Entity(realClass: CalendarEvent)
  factory CalendarEvent({
    @Id(assignable: true) @Default(0) int? id,
    required String title,
    String? description,
    @Property(type: PropertyType.date) required DateTime startTime,
    @Property(type: PropertyType.date) required DateTime endTime,
    @Default(false) bool isAllDay,
  }) = _CalendarEvent;
}