import 'package:fit_app/features/home/data/models/home_model.dart';
import 'package:fit_app/features/home/data/models/success_stories_model.dart';
import 'package:fit_app/features/home/data/repos/home_repo.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  int currentTabIndex = 0;
  SuccessStoresModel? storesModel;
  HomeModel? homeModel;

  changeBottonNavIndex(int index) {
    currentTabIndex = index;
    emit(HomeBottomNav());
  }

  fetchHomeData() async {
    emit(HomeLoading());
    final response = await homeRepo.getUser();
    response.fold((error) => emit(HomeFailure(error)), (success) {
      homeModel = success;
      emit(HomeSuccess());
    });
  }

  fetchSuccessStores() async {
    emit(StoresLoading());
    final response = await homeRepo.getSuccessStores();
    response.fold((error) => emit(StoresFailure(error)), (success) {
      storesModel = success;
      emit(StoresSuccess());
    });
  }
}
