import 'package:get_it/get_it.dart';
import 'features/portfolio/data/datasources/portfolio_local_datasource.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/domain/repositories/portfolio_repository.dart';
import 'features/portfolio/domain/usecases/get_experiences.dart';
import 'features/portfolio/domain/usecases/get_projects.dart';
import 'features/portfolio/domain/usecases/get_skills.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => PortfolioBloc(
        getProjects: sl(),
        getSkills: sl(),
        getExperiences: sl(),
      ));

  // Use Cases
  sl.registerLazySingleton(() => GetProjects(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));
  sl.registerLazySingleton(() => GetExperiences(sl()));

  // Repository
  sl.registerLazySingleton<PortfolioRepository>(() => PortfolioRepositoryImpl(sl()));

  // Data Sources
  sl.registerLazySingleton<PortfolioLocalDataSource>(() => PortfolioLocalDataSourceImpl());
}
