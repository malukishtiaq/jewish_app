import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/partial_stats_entity.dart';

/// Model for dashboard partial stats response
/// API: POST /Dashboard/PartialStats
class PartialStatsModel extends BaseModel<PartialStatsEntity> {
  final int booksId;
  final String bookName;
  final int noCompleted;
  final int noMissing;
  final double percentCompleted;

  PartialStatsModel({
    required this.booksId,
    required this.bookName,
    required this.noCompleted,
    required this.noMissing,
    required this.percentCompleted,
  });

  factory PartialStatsModel.fromMap(Map<String, dynamic> map) {
    return PartialStatsModel(
      booksId: numV(map['BooksId']) ?? 0,
      bookName: stringV(map['BookName']),
      noCompleted: numV(map['NoCompleted']) ?? 0,
      noMissing: numV(map['NoMissing']) ?? 0,
      percentCompleted: numV<double>(map['PercentCompleted']) ?? 0.0,
    );
  }

  factory PartialStatsModel.fromJson(String source) =>
      PartialStatsModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'BooksId': booksId,
      'BookName': bookName,
      'NoCompleted': noCompleted,
      'NoMissing': noMissing,
      'PercentCompleted': percentCompleted,
    };
  }

  @override
  PartialStatsEntity toEntity() => PartialStatsEntity(
        booksId: booksId,
        bookName: bookName,
        noCompleted: noCompleted,
        noMissing: noMissing,
        percentCompleted: percentCompleted,
      );
}

