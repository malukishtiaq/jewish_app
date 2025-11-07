import 'package:jewish_app/core/entities/base_entity.dart';

class ThisWeekEntity extends BaseEntity {
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

  ThisWeekEntity({
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

  @override
  List<Object?> get props => [
        bookName,
        bookTitle,
        chapterName,
        chapterTitle,
        chapterSubTitle,
        subChapter,
        chaptersId,
        previousChaptersId,
        nextChaptersId,
        fileUrl,
        rootUrl,
        isCompleted,
        isBookmark,
      ];
}

