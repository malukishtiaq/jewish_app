import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/calendar_chapter_entity.dart';

/// Model for calendar chapter (previous/next/current chapter)
class CalendarChapterModel extends BaseModel<CalendarChapterEntity> {
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

  CalendarChapterModel({
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

  factory CalendarChapterModel.fromMap(Map<String, dynamic> map) {
    return CalendarChapterModel(
      id: numV(map['Id']) ?? 0,
      isDeleted: boolV(map['IsDeleted']),
      changedOn: stringV(map['ChangedOn']),
      tokensIdChangedBy: numV(map['TokensId_ChangedBy']) ?? 0,
      booksId: numV(map['BooksId']) ?? 0,
      bookTitle: stringV(map['BookTitle']),
      name: stringV(map['Name']),
      title: stringV(map['Title']),
      subTitle: stringV(map['SubTitle']),
      subChapter: stringV(map['SubChapter']),
      filesIdAudio: numV(map['FilesId_Audio']) ?? 0,
      referenceEnglish: stringV(map['ReferenceEnglish']),
      referenceHebrew: stringV(map['ReferenceHebrew']),
      rootUrl: stringV(map['RootUrl']),
      fileUrl: stringV(map['FileUrl']),
      previousChaptersId: numV(map['PreviousChaptersId']) ?? 0,
      nextChaptersId: numV(map['NextChaptersId']) ?? 0,
    );
  }

  factory CalendarChapterModel.fromJson(String source) =>
      CalendarChapterModel.fromMap(json.decode(source));

  @override
  CalendarChapterEntity toEntity() => CalendarChapterEntity(
        id: id,
        isDeleted: isDeleted,
        changedOn: changedOn,
        tokensIdChangedBy: tokensIdChangedBy,
        booksId: booksId,
        bookTitle: bookTitle,
        name: name,
        title: title,
        subTitle: subTitle,
        subChapter: subChapter,
        filesIdAudio: filesIdAudio,
        referenceEnglish: referenceEnglish,
        referenceHebrew: referenceHebrew,
        rootUrl: rootUrl,
        fileUrl: fileUrl,
        previousChaptersId: previousChaptersId,
        nextChaptersId: nextChaptersId,
      );
}

