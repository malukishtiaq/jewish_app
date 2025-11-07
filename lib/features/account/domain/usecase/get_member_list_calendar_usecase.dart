import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/member_calendar_param.dart';
import '../entity/calendar_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetMemberListCalendarUsecase extends UseCase<CalendarEntity, MemberCalendarParam> {
  final IAccountRepository repository;

  GetMemberListCalendarUsecase(this.repository);

  @override
  Future<Result<AppErrors, CalendarEntity>> call(MemberCalendarParam param) async {
    return await repository.getMemberListCalendar(param);
  }
}

