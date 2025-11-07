import '../../../../../core/params/base_params.dart';

class ResetStudyDatesParam extends BaseParams {
  final int membersId;
  final String startDate;
  final int startChaptersId;

  ResetStudyDatesParam({
    required this.membersId,
    required this.startDate,
    required this.startChaptersId,
  });

  @override
  Map<String, dynamic> toMap() => {
        "MembersId": membersId.toString(),
        "StartDate": startDate,
        "StartChaptersId": startChaptersId,
      };
}

