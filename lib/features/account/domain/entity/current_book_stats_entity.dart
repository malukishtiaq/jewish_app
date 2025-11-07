import 'package:jewish_app/core/entities/base_entity.dart';

class CurrentBookStatsEntity extends BaseEntity {
  final String bookName;
  final String lastDate;
  final int noCompleted;
  final int noMissing;
  final double percentCompleted;
  final String chapterTitle;
  final int chapterId;

  CurrentBookStatsEntity({
    required this.bookName,
    required this.lastDate,
    required this.noCompleted,
    required this.noMissing,
    required this.percentCompleted,
    required this.chapterTitle,
    required this.chapterId,
  });

  @override
  List<Object?> get props => [
        bookName,
        lastDate,
        noCompleted,
        noMissing,
        percentCompleted,
        chapterTitle,
        chapterId,
      ];
}

