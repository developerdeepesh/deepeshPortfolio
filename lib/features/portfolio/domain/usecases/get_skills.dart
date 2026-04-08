import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/skill_entity.dart';
import '../repositories/portfolio_repository.dart';

class GetSkills implements UseCase<List<SkillEntity>, NoParams> {
  final PortfolioRepository repository;
  GetSkills(this.repository);

  @override
  Future<Either<Failure, List<SkillEntity>>> call(NoParams params) =>
      repository.getSkills();
}
