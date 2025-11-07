import 'package:jewish_app/core/entities/base_entity.dart';

class CalendarScheduleEntity extends BaseEntity {
  final int chaptersId;
  final int indexNo;
  final String studyScheduleDate;
  final String title;
  final String subChapter;
  final String fileUrl;
  final String rootUrl;
  final int previousChaptersId;
  final int nextChaptersId;
  final bool isStarted;
  final bool isCompleted;
  final String bookTitle;

  CalendarScheduleEntity({
    required this.chaptersId,
    required this.indexNo,
    required this.studyScheduleDate,
    required this.title,
    required this.subChapter,
    required this.fileUrl,
    required this.rootUrl,
    required this.previousChaptersId,
    required this.nextChaptersId,
    required this.isStarted,
    required this.isCompleted,
    required this.bookTitle,
  });

  @override
  List<Object?> get props => [
        chaptersId,
        indexNo,
        studyScheduleDate,
        title,
        subChapter,
        fileUrl,
        rootUrl,
        previousChaptersId,
        nextChaptersId,
        isStarted,
        isCompleted,
        bookTitle,
      ];
}

