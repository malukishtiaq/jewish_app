import 'package:jewish_app/core/entities/base_entity.dart';
import 'package:jewish_app/core/constants/enums/verification_type.dart';

class SendOtpEntity extends BaseEntity {
  final String otp;
  final int id;
  final VerificationType type;
  final String email;
  SendOtpEntity({
    required this.otp,
    required this.id,
    this.type = VerificationType.phone,
    this.email = "",
  });

  @override
  bool operator ==(covariant SendOtpEntity other) {
    if (identical(this, other)) return true;

    return other.otp == otp &&
        other.type == type &&
        other.email == email &&
        other.id == id;
  }

  @override
  int get hashCode =>
      otp.hashCode ^ type.hashCode ^ email.hashCode ^ id.hashCode;

  @override
  List<Object?> get props => [otp, type, email];

  SendOtpEntity copyWith({
    String? otp,
    int? id,
    VerificationType? type,
    String? email,
  }) {
    return SendOtpEntity(
      otp: otp ?? this.otp,
      id: id ?? this.id,
      type: type ?? this.type,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'SendOtpEntity(otp: $otp, type: $type, email: $email)';
}
