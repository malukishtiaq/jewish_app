import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/calendar_entity.dart';
import 'calendar_chapter_model.dart';
import 'calendar_schedule_model.dart';
import 'calendar_stats_model.dart';

/// Model for complete calendar response
/// API: POST /Member/ListCalendar and /Member/ListCalendarNextPrevious
class CalendarModel extends BaseModel<CalendarEntity> {
  final List<CalendarScheduleModel> calendarSchedule;
  final List<CalendarChapterModel> previousChapter;
  final List<CalendarChapterModel> nextChapter;
  final List<CalendarChapterModel> currentChapter;
  final List<CalendarStatsModel> calendarStats;

  CalendarModel({
    required this.calendarSchedule,
    required this.previousChapter,
    required this.nextChapter,
    required this.currentChapter,
    required this.calendarStats,
  });

  factory CalendarModel.fromMap(Map<String, dynamic> map) {
    return CalendarModel(
      calendarSchedule: (map['CalendarSchedule'] as List<dynamic>?)
              ?.map((e) =>
                  CalendarScheduleModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      previousChapter: (map['PreviousChapter'] as List<dynamic>?)
              ?.map((e) =>
                  CalendarChapterModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      nextChapter: (map['NextChapter'] as List<dynamic>?)
              ?.map(
                  (e) => CalendarChapterModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      currentChapter: (map['CurrentChapter'] as List<dynamic>?)
              ?.map((e) =>
                  CalendarChapterModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      calendarStats: (map['CalendarStats'] as List<dynamic>?)
              ?.map(
                  (e) => CalendarStatsModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  CalendarEntity toEntity() => CalendarEntity(
        calendarSchedule: calendarSchedule.map((m) => m.toEntity()).toList(),
        previousChapter: previousChapter.map((m) => m.toEntity()).toList(),
        nextChapter: nextChapter.map((m) => m.toEntity()).toList(),
        currentChapter: currentChapter.map((m) => m.toEntity()).toList(),
        calendarStats: calendarStats.map((m) => m.toEntity()).toList(),
      );
}

