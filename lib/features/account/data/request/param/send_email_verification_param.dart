import '../../../../../core/params/base_params.dart';

class SendEmailVerificationParam extends BaseParams {
  final int membersId;

  SendEmailVerificationParam({
    required this.membersId,
  });

  @override
  Map<String, dynamic> toMap() => {
        "MembersId": membersId,
      };
}
