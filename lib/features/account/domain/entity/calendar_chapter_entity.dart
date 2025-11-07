import 'package:jewish_app/core/entities/base_entity.dart';

class CalendarChapterEntity extends BaseEntity {
  final int id;
  final bool isDeleted;
  final String changedOn;
  final int tokensIdChangedBy;
  final int booksId;
  final String bookTitle;
  final String name;
  final String title;
  final String subTitle;
  final String subChapter;
  final int filesIdAudio;
  final String referenceEnglish;
  final String referenceHebrew;
  final String rootUrl;
  final String fileUrl;
  final int previousChaptersId;
  final int nextChaptersId;

  CalendarChapterEntity({
    required this.id,
    required this.isDeleted,
    required this.changedOn,
    required this.tokensIdChangedBy,
    required this.booksId,
    required this.bookTitle,
    required this.name,
    required this.title,
    required this.subTitle,
    required this.subChapter,
    required this.filesIdAudio,
    required this.referenceEnglish,
    required this.referenceHebrew,
    required this.rootUrl,
    required this.fileUrl,
    required this.previousChaptersId,
    required this.nextChaptersId,
  });

  @override
  List<Object?> get props => [
        id,
        isDeleted,
        changedOn,
        tokensIdChangedBy,
        booksId,
        bookTitle,
        name,
        title,
        subTitle,
        subChapter,
        filesIdAudio,
        referenceEnglish,
        referenceHebrew,
        rootUrl,
        fileUrl,
        previousChaptersId,
        nextChaptersId,
      ];
}

