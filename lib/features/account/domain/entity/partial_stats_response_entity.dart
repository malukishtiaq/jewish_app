import 'package:jewish_app/core/entities/base_entity.dart';
import 'partial_stats_entity.dart';

class PartialStatsResponseEntity extends BaseEntity {
  final List<PartialStatsEntity> result;
  final List<PartialStatsEntity> resultAliyas;

  PartialStatsResponseEntity({
    required this.result,
    required this.resultAliyas,
  });

  @override
  List<Object?> get props => [result, resultAliyas];
}

