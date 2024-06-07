import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CustomGeneralSettings extends StatelessWidget {
  const CustomGeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            "General",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomListTile(
          title: "Notifications",
          icon: Image.asset(AppAssets.notification),
          trailing: Switch(
            value: true,
            onChanged: (value) {
            },
            activeColor: Colors.black.withOpacity(.8),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Health",
          icon: Image.asset(AppAssets.health),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Terms and conditoins",
          icon: Image.asset(AppAssets.terms),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Meals language",
          icon: Image.asset(AppAssets.meals),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Transactions",
          icon: Image.asset(AppAssets.transaction),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        CustomListTile(
          title: "Language",
          icon: Image.asset(AppAssets.terms),
        ),
        Divider(
          color: Colors.grey.withOpacity(.5),
        ),
      ],
    );
  }
}
