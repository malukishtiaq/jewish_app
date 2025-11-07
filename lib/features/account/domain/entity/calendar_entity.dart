import 'package:jewish_app/core/entities/base_entity.dart';
import 'calendar_chapter_entity.dart';
import 'calendar_schedule_entity.dart';
import 'calendar_stats_entity.dart';

class CalendarEntity extends BaseEntity {
  final List<CalendarScheduleEntity> calendarSchedule;
  final List<CalendarChapterEntity> previousChapter;
  final List<CalendarChapterEntity> nextChapter;
  final List<CalendarChapterEntity> currentChapter;
  final List<CalendarStatsEntity> calendarStats;

  CalendarEntity({
    required this.calendarSchedule,
    required this.previousChapter,
    required this.nextChapter,
    required this.currentChapter,
    required this.calendarStats,
  });

  @override
  List<Object?> get props => [
        calendarSchedule,
        previousChapter,
        nextChapter,
        currentChapter,
        calendarStats,
      ];
}

