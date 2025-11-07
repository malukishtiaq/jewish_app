import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/features/account/domain/entity/achievements_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/current_book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/partial_stats_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/torah_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required PartialStatsResponseEntity partialStats,
    required List<TorahEntity> torah,
    required AchievementsResponseEntity achievements,
    required List<CurrentBookStatsEntity> currentBookStats,
  }) = _Loaded;
  const factory HomeState.error(AppErrors error) = _Error;
}

