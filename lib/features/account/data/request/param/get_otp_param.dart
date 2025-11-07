import '../../../../../core/params/base_params.dart';

class GetOtpParam extends BaseParams {
  final String email;

  GetOtpParam({required this.email});

  @override
  Map<String, dynamic> toMap() => {
        "Email": email,
      };
}

