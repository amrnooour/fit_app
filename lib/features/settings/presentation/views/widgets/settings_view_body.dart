import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_login_button.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_account_settings.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_general_settings.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_hey_text.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomHeyText(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.withOpacity(.5),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomAccountSettings(),
            const SizedBox(
              height: 30,
            ),
            const CustomGeneralSettings(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  CacheHelper().clearData(key: "token");
                  customNavigation(context, "/loginView");
                },
                child: const CustomLoginButton(
                  text: "Logout",
                  isEnabled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
