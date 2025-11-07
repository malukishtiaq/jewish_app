import 'package:jewish_app/core/entities/base_entity.dart';

class AchievementEntity extends BaseEntity {
  final String typeOfBook;
  final String bookName;
  final int noTotal;

  AchievementEntity({
    required this.typeOfBook,
    required this.bookName,
    required this.noTotal,
  });

  @override
  List<Object?> get props => [typeOfBook, bookName, noTotal];
}

