import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/profile_image_entity.dart';

class ProfileImageModel extends BaseModel<ProfileImageEntity> {
  final FileInfoModel fileInfo;

  ProfileImageModel({required this.fileInfo});

  factory ProfileImageModel.fromMap(Map<String, dynamic> map) {
    return ProfileImageModel(
      fileInfo:
          FileInfoModel.fromMap(map['FileInfo'] as Map<String, dynamic>? ?? {}),
    );
  }

  @override
  ProfileImageEntity toEntity() => ProfileImageEntity(
        fileInfo: fileInfo.toEntity(),
      );
}

class FileInfoModel extends BaseModel<FileInfoEntity> {
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

  FileInfoModel({
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

  factory FileInfoModel.fromMap(Map<String, dynamic> map) {
    return FileInfoModel(
      id: numV(map['Id']) ?? 0,
      isDeleted: boolV(map['IsDeleted']),
      changedOn: stringV(map['ChangedOn']),
      tokensIdChangedBy: numV(map['TokensId_ChangedBy']) ?? 0,
      metasId: numV(map['MetasId']) ?? 0,
      originalName: stringV(map['OriginalName']),
      fileRepo: stringV(map['FileRepo']),
      folder: stringV(map['Folder']),
      guid: stringV(map['Guid']),
      fileUrl: stringV(map['FileUrl']),
      description: stringV(map['Description']),
      mimeType: stringV(map['MimeType']),
    );
  }

  @override
  FileInfoEntity toEntity() => FileInfoEntity(
        id: id,
        isDeleted: isDeleted,
        changedOn: changedOn,
        tokensIdChangedBy: tokensIdChangedBy,
        metasId: metasId,
        originalName: originalName,
        fileRepo: fileRepo,
        folder: folder,
        guid: guid,
        fileUrl: fileUrl,
        description: description,
        mimeType: mimeType,
      );
}

