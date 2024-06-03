import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 0,
            currentIndex: context.read<HomeCubit>().currentTabIndex,
            onTap: (index) {
              context.read<HomeCubit>().changeBottonNavIndex(index);
            },
            items: [
              buildBottomNavItem(
                  Icons.home, context.read<HomeCubit>().currentTabIndex == 0),
              buildBottomNavItem(Icons.fitness_center,
                  context.read<HomeCubit>().currentTabIndex == 1),
              buildBottomNavItem(Icons.comment,
                  context.read<HomeCubit>().currentTabIndex == 2),
              buildBottomNavItem(Icons.fastfood_outlined,
                  context.read<HomeCubit>().currentTabIndex == 3),
              buildBottomNavItem(
                  Icons.menu, context.read<HomeCubit>().currentTabIndex == 4),
            ]);
      },
    );
  }

  buildBottomNavItem(IconData icon, bool isSelected) {
    return BottomNavigationBarItem(
      label: "",
        icon: isSelected
            ? Icon(
                icon,
                color: Colors.red,
                size: 30,
              )
            : Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ));
  }
}
