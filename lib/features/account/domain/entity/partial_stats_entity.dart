import 'package:jewish_app/core/entities/base_entity.dart';

class PartialStatsEntity extends BaseEntity {
  final int booksId;
  final String bookName;
  final int noCompleted;
  final int noMissing;
  final double percentCompleted;

  PartialStatsEntity({
    required this.booksId,
    required this.bookName,
    required this.noCompleted,
    required this.noMissing,
    required this.percentCompleted,
  });

  @override
  List<Object?> get props => [
        booksId,
        bookName,
        noCompleted,
        noMissing,
        percentCompleted,
      ];
}

