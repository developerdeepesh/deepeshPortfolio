import 'package:equatable/equatable.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/skill_entity.dart';
import '../../domain/entities/experience_entity.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<ProjectEntity> projects;
  final List<SkillEntity> skills;
  final List<ExperienceEntity> experiences;

  PortfolioLoaded({
    required this.projects,
    required this.skills,
    required this.experiences,
  });

  @override
  List<Object> get props => [projects, skills, experiences];
}

class PortfolioError extends PortfolioState {
  final String message;
  PortfolioError(this.message);

  @override
  List<Object> get props => [message];
}
