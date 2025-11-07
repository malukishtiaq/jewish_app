import 'package:jewish_app/core/entities/base_entity.dart';

class BookStatsEntity extends BaseEntity {
  final String typeOfBook;
  final int noCompleted;
  final int noMissing;
  final int noTotal;
  final double percentCompleted;

  BookStatsEntity({
    required this.typeOfBook,
    required this.noCompleted,
    required this.noMissing,
    required this.noTotal,
    required this.percentCompleted,
  });

  @override
  List<Object?> get props => [
        typeOfBook,
        noCompleted,
        noMissing,
        noTotal,
        percentCompleted,
      ];
}

