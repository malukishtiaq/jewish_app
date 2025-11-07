import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/torah_entity.dart';

/// Model for dashboard torah response
/// API: POST /Dashboard/Torah
class TorahModel extends BaseModel<TorahEntity> {
  final int booksId;
  final String bookName;
  final int noCompleted;
  final int noMissing;
  final int noTotal;
  final double percentCompleted;
  final double percentCompletedAliyas;
  final double noCompletedAliyas;
  final double noTotalAliyas;

  TorahModel({
    required this.booksId,
    required this.bookName,
    required this.noCompleted,
    required this.noMissing,
    required this.noTotal,
    required this.percentCompleted,
    required this.percentCompletedAliyas,
    required this.noCompletedAliyas,
    required this.noTotalAliyas,
  });

  factory TorahModel.fromMap(Map<String, dynamic> map) {
    return TorahModel(
      booksId: numV(map['BooksId']) ?? 0,
      bookName: stringV(map['BookName']),
      noCompleted: numV(map['NoCompleted']) ?? 0,
      noMissing: numV(map['NoMissing']) ?? 0,
      noTotal: numV(map['NoTotal']) ?? 0,
      percentCompleted: numV<double>(map['PercentCompleted']) ?? 0.0,
      percentCompletedAliyas: numV<double>(map['PercentCompletedAliyas']) ?? 0.0,
      noCompletedAliyas: numV<double>(map['NoCompletedAliyas']) ?? 0.0,
      noTotalAliyas: numV<double>(map['NoTotalAliyas']) ?? 0.0,
    );
  }

  factory TorahModel.fromJson(String source) =>
      TorahModel.fromMap(json.decode(source));

  @override
  TorahEntity toEntity() => TorahEntity(
        booksId: booksId,
        bookName: bookName,
        noCompleted: noCompleted,
        noMissing: noMissing,
        noTotal: noTotal,
        percentCompleted: percentCompleted,
        percentCompletedAliyas: percentCompletedAliyas,
        noCompletedAliyas: noCompletedAliyas,
        noTotalAliyas: noTotalAliyas,
      );
}

