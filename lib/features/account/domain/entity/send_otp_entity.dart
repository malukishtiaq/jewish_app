import 'package:jewish_app/core/entities/base_entity.dart';

class SendOtpEntity extends BaseEntity {
  final bool isExists;
  final int membersId;
  final String oneTimePassword;

  SendOtpEntity({
    required this.isExists,
    required this.membersId,
    required this.oneTimePassword,
  });

  @override
  bool operator ==(covariant SendOtpEntity other) {
    if (identical(this, other)) return true;

    return other.isExists == isExists &&
        other.membersId == membersId &&
        other.oneTimePassword == oneTimePassword;
  }

  @override
  int get hashCode =>
      isExists.hashCode ^ membersId.hashCode ^ oneTimePassword.hashCode;

  @override
  List<Object?> get props => [isExists, membersId, oneTimePassword];

  SendOtpEntity copyWith({
    bool? isExists,
    int? membersId,
    String? oneTimePassword,
  }) {
    return SendOtpEntity(
      isExists: isExists ?? this.isExists,
      membersId: membersId ?? this.membersId,
      oneTimePassword: oneTimePassword ?? this.oneTimePassword,
    );
  }

  @override
  String toString() =>
      'SendOtpEntity(isExists: $isExists, membersId: $membersId, oneTimePassword: $oneTimePassword)';
}
