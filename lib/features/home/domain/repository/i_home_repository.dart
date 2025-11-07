import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/achievements_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/current_book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/partial_stats_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/torah_entity.dart';

abstract class IHomeRepository {
  Future<Result<AppErrors, PartialStatsResponseEntity>> getDashboardPartialStats(
      DashboardParam param);

  Future<Result<AppErrors, List<TorahEntity>>> getDashboardTorah(
      DashboardParam param);

  Future<Result<AppErrors, AchievementsResponseEntity>> getDashboardAchievements(
      DashboardParam param);

  Future<Result<AppErrors, List<BookStatsEntity>>> getDashboardBookStats(
      DashboardParam param);

  Future<Result<AppErrors, List<CurrentBookStatsEntity>>>
      getDashboardCurrentBookStats(DashboardParam param);
}

