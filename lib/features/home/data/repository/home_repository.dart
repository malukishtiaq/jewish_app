import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/achievements_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/current_book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/partial_stats_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/torah_entity.dart';
import '../../domain/repository/i_home_repository.dart';
import 'package:jewish_app/features/account/domain/repository/iaccount_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final IAccountRepository _accountRepository;

  HomeRepository(this._accountRepository);

  @override
  Future<Result<AppErrors, PartialStatsResponseEntity>> getDashboardPartialStats(
      DashboardParam param) async {
    return await _accountRepository.getDashboardPartialStats(param);
  }

  @override
  Future<Result<AppErrors, List<TorahEntity>>> getDashboardTorah(
      DashboardParam param) async {
    return await _accountRepository.getDashboardTorah(param);
  }

  @override
  Future<Result<AppErrors, AchievementsResponseEntity>> getDashboardAchievements(
      DashboardParam param) async {
    return await _accountRepository.getDashboardAchievements(param);
  }

  @override
  Future<Result<AppErrors, List<BookStatsEntity>>> getDashboardBookStats(
      DashboardParam param) async {
    return await _accountRepository.getDashboardBookStats(param);
  }

  @override
  Future<Result<AppErrors, List<CurrentBookStatsEntity>>>
      getDashboardCurrentBookStats(DashboardParam param) async {
    return await _accountRepository.getDashboardCurrentBookStats(param);
  }
}

