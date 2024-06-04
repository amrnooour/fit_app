import 'package:fit_app/core/utils/app_assets.dart';
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
            currentIndex: context.read<HomeCubit>().currentTabIndex,
            onTap: (index) {
              context.read<HomeCubit>().changeBottonNavIndex(index);
            },
            items: [
              buildBottomNavItem(
                   Column(children: [
                    Image.asset(AppAssets.homeActive),
                    const SizedBox(height: 7,),
                    Image.asset(AppAssets.activeIcon),
                   ],),
                   Image.asset(AppAssets.home),
                   context.read<HomeCubit>().currentTabIndex == 0),
              buildBottomNavItem(
                  Column(children: [
                    Image.asset(AppAssets.workoutActive),
                    const SizedBox(height: 7,),
                    Image.asset(AppAssets.activeIcon),
                   ],),
                  Image.asset(AppAssets.workout),
                  context.read<HomeCubit>().currentTabIndex == 1),
              buildBottomNavItem(
                  Column(children: [
                    Image.asset(AppAssets.commentActive,color: Colors.red,),
                    const SizedBox(height: 7,),
                    Image.asset(AppAssets.activeIcon),
                   ],),  
                  Image.asset(AppAssets.comment),
                  context.read<HomeCubit>().currentTabIndex == 2),
              buildBottomNavItem(
                  Column(children: [
                    Image.asset(AppAssets.dietActive),
                    const SizedBox(height: 7,),
                    Image.asset(AppAssets.activeIcon),
                   ],),
                  Image.asset(AppAssets.diet),
                  context.read<HomeCubit>().currentTabIndex == 3),
              buildBottomNavItem(
                  Column(children: [
                    Image.asset(AppAssets.menuActive),
                    const SizedBox(height: 7,),
                    Image.asset(AppAssets.activeIcon),
                   ],),
                  Image.asset(AppAssets.menu),
                  context.read<HomeCubit>().currentTabIndex == 4),
            ]);
      },
    );
  }

  buildBottomNavItem(Widget iconActive,Widget icon, bool isSelected) {
    return BottomNavigationBarItem(
        label: "",
        icon: isSelected ? iconActive : icon);
  }
}
