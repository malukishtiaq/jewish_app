import 'package:jewish_app/core/entities/base_entity.dart';

class ValidateEmailVerificationEntity extends BaseEntity {
  final String otpValid;

  ValidateEmailVerificationEntity({required this.otpValid});

  @override
  List<Object?> get props => [otpValid];

  ValidateEmailVerificationEntity copyWith({String? otpValid}) {
    return ValidateEmailVerificationEntity(otpValid: otpValid ?? this.otpValid);
  }

  @override
  String toString() => 'ValidateEmailVerificationEntity(otpValid: $otpValid)';

  @override
  bool operator ==(covariant ValidateEmailVerificationEntity other) {
    if (identical(this, other)) return true;
    return other.otpValid == otpValid;
  }

  @override
  int get hashCode => otpValid.hashCode;
}
