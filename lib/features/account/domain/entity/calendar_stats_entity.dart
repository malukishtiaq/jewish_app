import 'package:jewish_app/core/entities/base_entity.dart';

class CalendarStatsEntity extends BaseEntity {
  final String dateLearning;
  final double learningTime;
  final double audioTime;

  CalendarStatsEntity({
    required this.dateLearning,
    required this.learningTime,
    required this.audioTime,
  });

  @override
  List<Object?> get props => [dateLearning, learningTime, audioTime];
}

