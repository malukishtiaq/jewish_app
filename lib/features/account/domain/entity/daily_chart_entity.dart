import 'package:jewish_app/core/entities/base_entity.dart';

class DailyChartEntity extends BaseEntity {
  final String studyDate;
  final int noOfMinutesAudio;
  final int noOfMinutesRead;

  DailyChartEntity({
    required this.studyDate,
    required this.noOfMinutesAudio,
    required this.noOfMinutesRead,
  });

  @override
  List<Object?> get props => [studyDate, noOfMinutesAudio, noOfMinutesRead];
}

