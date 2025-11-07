import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/current_book_stats_entity.dart';

/// Model for dashboard current book stats response
/// API: POST /Dashboard/CurrentBookStats
class CurrentBookStatsModel extends BaseModel<CurrentBookStatsEntity> {
  final String bookName;
  final String lastDate;
  final int noCompleted;
  final int noMissing;
  final double percentCompleted;
  final String chapterTitle;
  final int chapterId;

  CurrentBookStatsModel({
    required this.bookName,
    required this.lastDate,
    required this.noCompleted,
    required this.noMissing,
    required this.percentCompleted,
    required this.chapterTitle,
    required this.chapterId,
  });

  factory CurrentBookStatsModel.fromMap(Map<String, dynamic> map) {
    return CurrentBookStatsModel(
      bookName: stringV(map['BookName']),
      lastDate: stringV(map['LastDate']),
      noCompleted: numV(map['NoCompleted']) ?? 0,
      noMissing: numV(map['NoMissing']) ?? 0,
      percentCompleted: numV<double>(map['PercentCompleted']) ?? 0.0,
      chapterTitle: stringV(map['ChapterTitle']),
      chapterId: numV(map['ChapterId']) ?? 0,
    );
  }

  factory CurrentBookStatsModel.fromJson(String source) =>
      CurrentBookStatsModel.fromMap(json.decode(source));

  @override
  CurrentBookStatsEntity toEntity() => CurrentBookStatsEntity(
        bookName: bookName,
        lastDate: lastDate,
        noCompleted: noCompleted,
        noMissing: noMissing,
        percentCompleted: percentCompleted,
        chapterTitle: chapterTitle,
        chapterId: chapterId,
      );
}

