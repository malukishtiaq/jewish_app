import '../../../../../core/params/base_params.dart';

class MemberCalendarParam extends BaseParams {
  final int membersId;
  final int calendarMonth;
  final int calendarYear;
  final int calendarDay;

  MemberCalendarParam({
    required this.membersId,
    required this.calendarMonth,
    required this.calendarYear,
    required this.calendarDay,
  });

  @override
  Map<String, dynamic> toMap() => {
        "MembersId": membersId,
        "CalendarMonth": calendarMonth,
        "CalendarYear": calendarYear,
        "CalendarDay": calendarDay,
      };
}

