import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_skills.dart';
import '../../domain/usecases/get_experiences.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;

  PortfolioBloc({
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
  }) : super(PortfolioInitial()) {
    on<LoadPortfolioData>(_onLoadPortfolioData);
  }

  Future<void> _onLoadPortfolioData(
    LoadPortfolioData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(PortfolioLoading());

    final projectsResult = await getProjects(NoParams());
    final skillsResult = await getSkills(NoParams());
    final experiencesResult = await getExperiences(NoParams());

    projectsResult.fold(
      (failure) => emit(PortfolioError(failure.message)),
      (projects) => skillsResult.fold(
        (failure) => emit(PortfolioError(failure.message)),
        (skills) => experiencesResult.fold(
          (failure) => emit(PortfolioError(failure.message)),
          (experiences) => emit(PortfolioLoaded(
            projects: projects,
            skills: skills,
            experiences: experiences,
          )),
        ),
      ),
    );
  }
}
