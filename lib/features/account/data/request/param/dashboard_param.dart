import '../../../../../core/params/base_params.dart';

/// Generic parameter for dashboard APIs that only require member ID
class DashboardParam extends BaseParams {
  final int membersId;

  DashboardParam({required this.membersId});

  @override
  Map<String, dynamic> toMap() => {
        "MembersId": membersId.toString(),
      };
}

