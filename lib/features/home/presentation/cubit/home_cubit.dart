import 'package:fit_app/features/home/data/repos/home_repo.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  int currentTabIndex = 0;

  changeBottonNavIndex(int index) {
    currentTabIndex = index;
    emit(HomeBottomNav());
  }

  fetchHomeData() async {
    emit(HomeLoading());
    final response = await homeRepo.getUser();
    response.fold((error) => emit(HomeFailure(error)),
        (success) => emit(HomeSuccess(success)));
  }
}
