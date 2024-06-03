import 'package:fit_app/features/diet/presentation/views/diet_view.dart';
import 'package:fit_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fit_app/features/settings/presentation/views/settings_view.dart';
import 'package:fit_app/features/thoughts/presentation/views/throughts_view.dart';
import 'package:fit_app/features/workout/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static const baseUrl = "https://staging.fitexpert.team/app/";
  static const checkMobile = "domains/auth/check-mobile";
  static const inputCode = "domains/auth/user";
  static const homeData = "data/screens/home";
  static const mobile = "mobile";
  static const code = "code";
  static const token = "token";
  static const networkImage =
      "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=600";
  static const networkImage1 =
      "https://st2.depositphotos.com/2972641/6060/i/450/depositphotos_60600635-stock-photo-closeup-of-a-muscular-young.jpg";
  static const articleImage =
      "https://fatstacksblog.com/wp-content/uploads/2019/11/Person-writing-article-nov26.jpg";
      

  static const List<Widget> tabs = [
    HomeViewBody(),
    WorkoutView(),
    ThroughtsView(),
    DietView(),
    SettingsView(),
  ];
}
