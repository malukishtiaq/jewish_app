// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jewish_app/core/entities/base_entity.dart';

class ValidateOtpEntity extends BaseEntity {
  final String otpValid;
  final int id;
  ValidateOtpEntity({required this.otpValid, required this.id});

  @override
  List<Object?> get props => [otpValid, id];

  ValidateOtpEntity copyWith({String? otpValid, int? Id}) {
    return ValidateOtpEntity(otpValid: otpValid ?? this.otpValid, id: Id ?? id);
  }

  @override
  String toString() => 'ValidateOtpEntity(otpValid: $otpValid, Id: $id)';

  @override
  bool operator ==(covariant ValidateOtpEntity other) {
    if (identical(this, other)) return true;

    return other.otpValid == otpValid && other.id == id;
  }

  @override
  int get hashCode => otpValid.hashCode ^ id.hashCode;
}
