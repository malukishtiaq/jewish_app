import '../../../../../core/params/base_params.dart';

class MemberGetParam extends BaseParams {
  final int id;
  final String email;
  final int memberId;

  MemberGetParam({this.id = 0, this.email = "", this.memberId = 0});

  @override
  Map<String, dynamic> toMap() => {
        if (id > 0) "Id": id,
        if (email.isNotEmpty) "Email": email,
        if (memberId > 0) "MembersId": memberId,
      };
}
