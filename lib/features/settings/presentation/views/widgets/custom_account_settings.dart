import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CustomAccountSettings extends StatelessWidget {
  const CustomAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            "Account",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomListTile(
          onTap: () {
            customNavigation(context, "/editView");
          },
          title: "Edit profile",
          icon: Image.asset(AppAssets.editProfile),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Previous test",
          icon: Image.asset(AppAssets.previousTest),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Feedback",
          icon: Image.asset(AppAssets.feedBack),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Workout program instructions",
          icon: Image.asset(AppAssets.workoutProram),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Weight log",
          icon: Image.asset(AppAssets.weightLog),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Calories Calculator",
          icon: Image.asset(AppAssets.carioesCalculator),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
      ],
    );
  }
}
