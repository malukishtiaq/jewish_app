import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/common/local_storage.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/achievements_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/current_book_stats_entity.dart';
import 'package:jewish_app/features/account/domain/entity/partial_stats_response_entity.dart';
import 'package:jewish_app/features/account/domain/entity/torah_entity.dart';
import 'package:jewish_app/features/home/domain/usecase/get_home_achievements_usecase.dart';
import 'package:jewish_app/features/home/domain/usecase/get_home_current_book_stats_usecase.dart';
import 'package:jewish_app/features/home/domain/usecase/get_home_partial_stats_usecase.dart';
import 'package:jewish_app/features/home/domain/usecase/get_home_torah_usecase.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getHomePartialStatsUsecase,
    this._getHomeTorahUsecase,
    this._getHomeAchievementsUsecase,
    this._getHomeCurrentBookStatsUsecase,
  ) : super(const HomeState.initial());

  final GetHomePartialStatsUsecase _getHomePartialStatsUsecase;
  final GetHomeTorahUsecase _getHomeTorahUsecase;
  final GetHomeAchievementsUsecase _getHomeAchievementsUsecase;
  final GetHomeCurrentBookStatsUsecase _getHomeCurrentBookStatsUsecase;

  Future<void> loadDashboardData() async {
    emit(const HomeState.loading());

    try {
      // Get member ID from local storage
      final memberId = _getMemberId();
      if (memberId == null) {
        emit(const HomeState.error(AppErrors.unauthorizedError()));
        return;
      }

      final param = DashboardParam(membersId: memberId);

      final partialStats = await _getDashboardPartialStats(param);
      if (partialStats == null) return;

      final torah = await _getDashboardTorah(param);
      if (torah == null) return;

      final achievements = await _getDashboardAchievements(param);
      if (achievements == null) return;

      final currentBookStats = await _getDashboardCurrentBookStats(param);
      if (currentBookStats == null) return;

      // Emit loaded state with all data
      emit(HomeState.loaded(
        partialStats: partialStats,
        torah: torah,
        achievements: achievements,
        currentBookStats: currentBookStats,
      ));
    } catch (e) {
      emit(const HomeState.error(AppErrors.unknownError()));
    }
  }

  int? _getMemberId() {
    final memberId = LocalStorage.memberID;
    if (memberId <= 0) {
      return null;
    }
    return memberId;
  }

  Future<PartialStatsResponseEntity?> _getDashboardPartialStats(
    DashboardParam param,
  ) async {
    PartialStatsResponseEntity? response;
    AppErrors? failure;

    final result = await _getHomePartialStatsUsecase(param);
    result.pick(
      onData: (data) => response = data,
      onError: (error) => failure = error,
    );

    if (failure != null) {
      emit(HomeState.error(failure!));
      return null;
    }

    return response;
  }

  Future<List<TorahEntity>?> _getDashboardTorah(
    DashboardParam param,
  ) async {
    List<TorahEntity>? response;
    AppErrors? failure;

    final result = await _getHomeTorahUsecase(param);
    result.pick(
      onData: (data) => response = data,
      onError: (error) => failure = error,
    );

    if (failure != null) {
      emit(HomeState.error(failure!));
      return null;
    }

    return response;
  }

  Future<AchievementsResponseEntity?> _getDashboardAchievements(
    DashboardParam param,
  ) async {
    AchievementsResponseEntity? response;
    AppErrors? failure;

    final result = await _getHomeAchievementsUsecase(param);
    result.pick(
      onData: (data) => response = data,
      onError: (error) => failure = error,
    );

    if (failure != null) {
      emit(HomeState.error(failure!));
      return null;
    }

    return response;
  }

  Future<List<CurrentBookStatsEntity>?> _getDashboardCurrentBookStats(
    DashboardParam param,
  ) async {
    List<CurrentBookStatsEntity>? response;
    AppErrors? failure;

    final result = await _getHomeCurrentBookStatsUsecase(param);
    result.pick(
      onData: (data) => response = data,
      onError: (error) => failure = error,
    );

    if (failure != null) {
      emit(HomeState.error(failure!));
      return null;
    }

    return response;
  }
}
