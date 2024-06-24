import 'package:fit_app/features/thoughts/data/models/thoughts_model.dart';
import 'package:fit_app/features/thoughts/data/repos/thoughts_repo.dart';
import 'package:fit_app/features/thoughts/presentation/cubit/thoughts_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThoughtsCubit extends Cubit<ThoughtsStates> {
  ThoughtsRepo thoughtsRepo;
  ThoughtsCubit(this.thoughtsRepo) : super(ThoughtsIntial());
  ThoughtsModel? thoughtsModel;

  getMedia() async {
    emit(ThoughtsLoading());
    final response = await thoughtsRepo.getMedia();
    response.fold((error) => emit(ThoughtsFailure(errorMessage: error)),
        (success) {
      thoughtsModel = success;
      emit(ThoughtsSuccess());
    });
  }
}
