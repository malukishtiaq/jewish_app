import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/this_week_entity.dart';

class ThisWeekModel extends BaseModel<ThisWeekEntity> {
  final String bookName;
  final String bookTitle;
  final String chapterName;
  final String chapterTitle;
  final String chapterSubTitle;
  final String subChapter;
  final int chaptersId;
  final int previousChaptersId;
  final int nextChaptersId;
  final String fileUrl;
  final String rootUrl;
  final bool isCompleted;
  final bool isBookmark;

  ThisWeekModel({
    required this.bookName,
    required this.bookTitle,
    required this.chapterName,
    required this.chapterTitle,
    required this.chapterSubTitle,
    required this.subChapter,
    required this.chaptersId,
    required this.previousChaptersId,
    required this.nextChaptersId,
    required this.fileUrl,
    required this.rootUrl,
    required this.isCompleted,
    required this.isBookmark,
  });

  factory ThisWeekModel.fromMap(Map<String, dynamic> map) {
    return ThisWeekModel(
      bookName: stringV(map['BookName']),
      bookTitle: stringV(map['BookTitle']),
      chapterName: stringV(map['ChapterName']),
      chapterTitle: stringV(map['ChapterTitle']),
      chapterSubTitle: stringV(map['ChapterSubTitle']),
      subChapter: stringV(map['SubChapter']),
      chaptersId: numV(map['ChaptersId']) ?? 0,
      previousChaptersId: numV(map['PreviousChaptersId']) ?? 0,
      nextChaptersId: numV(map['NextChaptersId']) ?? 0,
      fileUrl: stringV(map['FileUrl']),
      rootUrl: stringV(map['RootUrl']),
      isCompleted: boolV(map['IsCompleted']),
      isBookmark: boolV(map['IsBookmark']),
    );
  }

  @override
  ThisWeekEntity toEntity() => ThisWeekEntity(
        bookName: bookName,
        bookTitle: bookTitle,
        chapterName: chapterName,
        chapterTitle: chapterTitle,
        chapterSubTitle: chapterSubTitle,
        subChapter: subChapter,
        chaptersId: chaptersId,
        previousChaptersId: previousChaptersId,
        nextChaptersId: nextChaptersId,
        fileUrl: fileUrl,
        rootUrl: rootUrl,
        isCompleted: isCompleted,
        isBookmark: isBookmark,
      );
}

