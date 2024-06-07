import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomHeyText extends StatelessWidget {
  const CustomHeyText({super.key});

  @override
  Widget build(BuildContext context) {
    final name = CacheHelper().getData(key: "name");
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
              Text(
                "$name! ",
                style: Styles.hey.copyWith(fontWeight: FontWeight.w400),
              ),
              Image.asset(AppAssets.wave)
            ],
          )
        ],
      ),
    );
  }
}
