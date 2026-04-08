import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/project_entity.dart';
import '../entities/skill_entity.dart';
import '../entities/experience_entity.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
  Future<Either<Failure, List<SkillEntity>>> getSkills();
  Future<Either<Failure, List<ExperienceEntity>>> getExperiences();
}
