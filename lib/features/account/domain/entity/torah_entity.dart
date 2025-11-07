import 'package:jewish_app/core/entities/base_entity.dart';

class TorahEntity extends BaseEntity {
  final int booksId;
  final String bookName;
  final int noCompleted;
  final int noMissing;
  final int noTotal;
  final double percentCompleted;
  final double percentCompletedAliyas;
  final double noCompletedAliyas;
  final double noTotalAliyas;

  TorahEntity({
    required this.booksId,
    required this.bookName,
    required this.noCompleted,
    required this.noMissing,
    required this.noTotal,
    required this.percentCompleted,
    required this.percentCompletedAliyas,
    required this.noCompletedAliyas,
    required this.noTotalAliyas,
  });

  @override
  List<Object?> get props => [
        booksId,
        bookName,
        noCompleted,
        noMissing,
        noTotal,
        percentCompleted,
        percentCompletedAliyas,
        noCompletedAliyas,
        noTotalAliyas,
      ];
}

