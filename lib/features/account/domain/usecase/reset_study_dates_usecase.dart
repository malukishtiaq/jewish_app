import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/reset_study_dates_param.dart';
import '../repository/iaccount_repository.dart';

@singleton
class ResetStudyDatesUsecase extends UseCase<EmptyResponse, ResetStudyDatesParam> {
  final IAccountRepository repository;

  ResetStudyDatesUsecase(this.repository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(ResetStudyDatesParam param) async {
    return await repository.resetStudyDates(param);
  }
}

