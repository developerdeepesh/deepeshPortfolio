import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/experience_entity.dart';
import '../repositories/portfolio_repository.dart';

class GetExperiences implements UseCase<List<ExperienceEntity>, NoParams> {
  final PortfolioRepository repository;
  GetExperiences(this.repository);

  @override
  Future<Either<Failure, List<ExperienceEntity>>> call(NoParams params) =>
      repository.getExperiences();
}
