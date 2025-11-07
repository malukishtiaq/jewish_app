import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/achievements_response_entity.dart';
import 'achievement_model.dart';

/// Model for dashboard achievements response
/// API: POST /Dashboard/Achievements
/// Response contains two arrays: Study and ALiyas
class AchievementsResponseModel extends BaseModel<AchievementsResponseEntity> {
  final List<AchievementModel> study;
  final List<AchievementModel> aliyas;

  AchievementsResponseModel({
    required this.study,
    required this.aliyas,
  });

  factory AchievementsResponseModel.fromMap(Map<String, dynamic> map) {
    return AchievementsResponseModel(
      study: (map['Study'] as List<dynamic>?)
              ?.map((e) => AchievementModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      aliyas: (map['ALiyas'] as List<dynamic>?)
              ?.map((e) => AchievementModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  AchievementsResponseEntity toEntity() => AchievementsResponseEntity(
        study: study.map((m) => m.toEntity()).toList(),
        aliyas: aliyas.map((m) => m.toEntity()).toList(),
      );
}

