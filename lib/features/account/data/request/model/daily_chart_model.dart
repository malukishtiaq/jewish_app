import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/daily_chart_entity.dart';

class DailyChartModel extends BaseModel<DailyChartEntity> {
  final String studyDate;
  final int noOfMinutesAudio;
  final int noOfMinutesRead;

  DailyChartModel({
    required this.studyDate,
    required this.noOfMinutesAudio,
    required this.noOfMinutesRead,
  });

  factory DailyChartModel.fromMap(Map<String, dynamic> map) {
    return DailyChartModel(
      studyDate: stringV(map['StudyDate']),
      noOfMinutesAudio: numV(map['NoOfMinutesAudio']) ?? 0,
      noOfMinutesRead: numV(map['NoOfMinutesRead']) ?? 0,
    );
  }

  @override
  DailyChartEntity toEntity() => DailyChartEntity(
        studyDate: studyDate,
        noOfMinutesAudio: noOfMinutesAudio,
        noOfMinutesRead: noOfMinutesRead,
      );
}

