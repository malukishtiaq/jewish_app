import 'package:jewish_app/core/entities/base_entity.dart';

class ProfileImageEntity extends BaseEntity {
  final FileInfoEntity fileInfo;

  ProfileImageEntity({required this.fileInfo});

  @override
  List<Object?> get props => [fileInfo];
}

class FileInfoEntity extends BaseEntity {
  final int id;
  final bool isDeleted;
  final String changedOn;
  final int tokensIdChangedBy;
  final int metasId;
  final String originalName;
  final String fileRepo;
  final String folder;
  final String guid;
  final String fileUrl;
  final String description;
  final String mimeType;

  FileInfoEntity({
    required this.id,
    required this.isDeleted,
    required this.changedOn,
    required this.tokensIdChangedBy,
    required this.metasId,
    required this.originalName,
    required this.fileRepo,
    required this.folder,
    required this.guid,
    required this.fileUrl,
    required this.description,
    required this.mimeType,
  });

  @override
  List<Object?> get props => [
        id,
        isDeleted,
        changedOn,
        tokensIdChangedBy,
        metasId,
        originalName,
        fileRepo,
        folder,
        guid,
        fileUrl,
        description,
        mimeType,
      ];
}

