import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.technologies,
    required super.imageUrl,
    super.githubUrl,
    super.playStoreUrl,
    super.appStoreUrl,
    super.isFeatured,
  });
}
