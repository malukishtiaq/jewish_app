import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/calendar_schedule_entity.dart';

/// Model for calendar schedule item
class CalendarScheduleModel extends BaseModel<CalendarScheduleEntity> {
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

  CalendarScheduleModel({
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

  factory CalendarScheduleModel.fromMap(Map<String, dynamic> map) {
    return CalendarScheduleModel(
      chaptersId: numV(map['ChaptersId']) ?? 0,
      indexNo: numV(map['IndexNo']) ?? 0,
      studyScheduleDate: stringV(map['StudyScheduleDate']),
      title: stringV(map['Title']),
      subChapter: stringV(map['SubChapter']),
      fileUrl: stringV(map['FileUrl']),
      rootUrl: stringV(map['RootUrl']),
      previousChaptersId: numV(map['PreviousChaptersId']) ?? 0,
      nextChaptersId: numV(map['NextChaptersId']) ?? 0,
      isStarted: boolV(map['IsStarted']),
      isCompleted: boolV(map['IsCompleted']),
      bookTitle: stringV(map['BookTitle']),
    );
  }

  factory CalendarScheduleModel.fromJson(String source) =>
      CalendarScheduleModel.fromMap(json.decode(source));

  @override
  CalendarScheduleEntity toEntity() => CalendarScheduleEntity(
        chaptersId: chaptersId,
        indexNo: indexNo,
        studyScheduleDate: studyScheduleDate,
        title: title,
        subChapter: subChapter,
        fileUrl: fileUrl,
        rootUrl: rootUrl,
        previousChaptersId: previousChaptersId,
        nextChaptersId: nextChaptersId,
        isStarted: isStarted,
        isCompleted: isCompleted,
        bookTitle: bookTitle,
      );
}

