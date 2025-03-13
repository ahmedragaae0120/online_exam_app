import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/get_all_subjects_usecase.dart';
import 'explore_intent.dart';
import 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final GetAllSubjectsUsecase getAllSubjectsUsecase;

  ExploreCubit({required this.getAllSubjectsUsecase}) : super(ExploreInitial());

  Future<void> getSubjects() async {
    emit(ExploreLoadingState());
    final result = await getAllSubjectsUsecase.execute();

    switch (result) {
      case Success():
        emit(ExploreLoadedState(subjects: result.data ?? []));
      case Error():
        emit(ExploreErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(ExploreIntent intent) {
    switch (intent) {
      case GetSubjectsIntent():
        getSubjects();
        break;
    }
  }
}
