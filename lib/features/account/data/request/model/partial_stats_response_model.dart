import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/partial_stats_response_entity.dart';
import 'partial_stats_model.dart';

/// Model for dashboard partial stats response wrapper
/// API: POST /Dashboard/PartialStats
/// Response: { "Result": [...], "ResultAliyas": [...] }
class PartialStatsResponseModel extends BaseModel<PartialStatsResponseEntity> {
  final List<PartialStatsModel> result;
  final List<PartialStatsModel> resultAliyas;

  PartialStatsResponseModel({
    required this.result,
    required this.resultAliyas,
  });

  factory PartialStatsResponseModel.fromMap(Map<String, dynamic> map) {
    return PartialStatsResponseModel(
      result: (map['Result'] as List<dynamic>?)
              ?.map((e) => PartialStatsModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      resultAliyas: (map['ResultAliyas'] as List<dynamic>?)
              ?.map((e) => PartialStatsModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  PartialStatsResponseEntity toEntity() => PartialStatsResponseEntity(
        result: result.map((m) => m.toEntity()).toList(),
        resultAliyas: resultAliyas.map((m) => m.toEntity()).toList(),
      );
}

