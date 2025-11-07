import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/book_stats_entity.dart';

/// Model for dashboard book stats response
/// API: POST /Dashboard/BookStats
class BookStatsModel extends BaseModel<BookStatsEntity> {
  final String typeOfBook;
  final int noCompleted;
  final int noMissing;
  final int noTotal;
  final double percentCompleted;

  BookStatsModel({
    required this.typeOfBook,
    required this.noCompleted,
    required this.noMissing,
    required this.noTotal,
    required this.percentCompleted,
  });

  factory BookStatsModel.fromMap(Map<String, dynamic> map) {
    return BookStatsModel(
      typeOfBook: stringV(map['TypeOfBook']),
      noCompleted: numV(map['NoCompleted']) ?? 0,
      noMissing: numV(map['NoMissing']) ?? 0,
      noTotal: numV(map['NoTotal']) ?? 0,
      percentCompleted: numV<double>(map['PercentCompleted']) ?? 0.0,
    );
  }

  factory BookStatsModel.fromJson(String source) =>
      BookStatsModel.fromMap(json.decode(source));

  @override
  BookStatsEntity toEntity() => BookStatsEntity(
        typeOfBook: typeOfBook,
        noCompleted: noCompleted,
        noMissing: noMissing,
        noTotal: noTotal,
        percentCompleted: percentCompleted,
      );
}

