import 'package:jewish_app/core/entities/base_entity.dart';
import 'achievement_entity.dart';

class AchievementsResponseEntity extends BaseEntity {
  final List<AchievementEntity> study;
  final List<AchievementEntity> aliyas;

  AchievementsResponseEntity({
    required this.study,
    required this.aliyas,
  });

  @override
  List<Object?> get props => [study, aliyas];
}

