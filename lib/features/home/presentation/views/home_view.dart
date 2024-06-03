import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          body: Constants.tabs[context.read<HomeCubit>().currentTabIndex],
          bottomNavigationBar: const CustomBottomNav(),
        );
      },
    );
  }
}
