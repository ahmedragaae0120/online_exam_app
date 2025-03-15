import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/use_cases/get_all_exams_on_subject_usecase.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/ui/all_exams_on_subject/viewmodel/get_all_exams_on_subject_intent.dart';
import 'package:online_exam_app/ui/all_exams_on_subject/viewmodel/get_all_exams_on_subject_state.dart';

@injectable
class AllExamsCubit extends Cubit<AllExamsState> {
  final GetAllExamsOnSubjectUsecase getAllExamsOnSubjectUsecase;

  AllExamsCubit({required this.getAllExamsOnSubjectUsecase})
      : super(AllExamsInitial());

  Future<void> getAllExams(String subjectId) async {
    emit(AllExamsLoadingState());
    final result = await getAllExamsOnSubjectUsecase.execute(subjectId);

    switch (result) {
      case Success():
        emit(AllExamsLoadedState(exams: result.data ?? []));
      case Error():
        emit(AllExamsErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(AllExamsIntent intent) {
    switch (intent) {
      case GetAllExamsOnSubjectIntent():
        getAllExams(intent.subjectId);
        break;
    }
  }
}
