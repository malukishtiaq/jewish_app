import 'package:jewish_app/core/entities/base_entity.dart';

class SendEmailVerificationEntity extends BaseEntity {
  final String status;

  SendEmailVerificationEntity({required this.status});

  @override
  List<Object?> get props => [status];

  SendEmailVerificationEntity copyWith({String? status}) {
    return SendEmailVerificationEntity(status: status ?? this.status);
  }

  @override
  String toString() => 'SendEmailVerificationEntity(status: $status)';

  @override
  bool operator ==(covariant SendEmailVerificationEntity other) {
    if (identical(this, other)) return true;
    return other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
