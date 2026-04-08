import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/skill_entity.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_datasource.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource dataSource;
  PortfolioRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      return Right(dataSource.getProjects());
    } catch (e) {
      return Left(DataFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SkillEntity>>> getSkills() async {
    try {
      return Right(dataSource.getSkills());
    } catch (e) {
      return Left(DataFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExperienceEntity>>> getExperiences() async {
    try {
      return Right(dataSource.getExperiences());
    } catch (e) {
      return Left(DataFailure(e.toString()));
    }
  }
}
