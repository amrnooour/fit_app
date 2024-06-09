import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/styles.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeyText extends StatelessWidget {
  const CustomHeyText({super.key});

  @override
  Widget build(BuildContext context) {
    final name = CacheHelper().getData(key: "editedName");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hey",
            style: Styles.hey,
          ),
          Row(
            children: [
              BlocBuilder<SettingsCubit, SettingsStates>(
                builder: (context, state) {
                  return Text(
                    state is SettingsSuccess?"${context.read<SettingsCubit>().editedName}! " 
                    :"$name!",
                    style: Styles.hey.copyWith(fontWeight: FontWeight.w400),
                  );
                },
              ),
              Image.asset(AppAssets.wave)
            ],
          )
        ],
      ),
    );
  }
}
