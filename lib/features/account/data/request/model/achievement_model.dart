import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/achievement_entity.dart';

/// Model for individual achievement item
class AchievementModel extends BaseModel<AchievementEntity> {
  final String typeOfBook;
  final String bookName;
  final int noTotal;

  AchievementModel({
    required this.typeOfBook,
    required this.bookName,
    required this.noTotal,
  });

  factory AchievementModel.fromMap(Map<String, dynamic> map) {
    return AchievementModel(
      typeOfBook: stringV(map['TypeOfBook']),
      bookName: stringV(map['BookName']),
      noTotal: numV(map['NoTotal']) ?? 0,
    );
  }

  factory AchievementModel.fromJson(String source) =>
      AchievementModel.fromMap(json.decode(source));

  @override
  AchievementEntity toEntity() => AchievementEntity(
        typeOfBook: typeOfBook,
        bookName: bookName,
        noTotal: noTotal,
      );
}

