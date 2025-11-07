import 'dart:convert';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/calendar_stats_entity.dart';

/// Model for calendar stats
class CalendarStatsModel extends BaseModel<CalendarStatsEntity> {
  final String dateLearning;
  final double learningTime;
  final double audioTime;

  CalendarStatsModel({
    required this.dateLearning,
    required this.learningTime,
    required this.audioTime,
  });

  factory CalendarStatsModel.fromMap(Map<String, dynamic> map) {
    return CalendarStatsModel(
      dateLearning: stringV(map['DateLearning']),
      learningTime: numV<double>(map['LearningTime']) ?? 0.0,
      audioTime: numV<double>(map['AudioTime']) ?? 0.0,
    );
  }

  factory CalendarStatsModel.fromJson(String source) =>
      CalendarStatsModel.fromMap(json.decode(source));

  @override
  CalendarStatsEntity toEntity() => CalendarStatsEntity(
        dateLearning: dateLearning,
        learningTime: learningTime,
        audioTime: audioTime,
      );
}

