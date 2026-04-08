import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool isFeatured;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.isFeatured = false,
  });

  @override
  List<Object?> get props =>
      [id, title, description, technologies, imageUrl, githubUrl, playStoreUrl,appStoreUrl,isFeatured];
}
