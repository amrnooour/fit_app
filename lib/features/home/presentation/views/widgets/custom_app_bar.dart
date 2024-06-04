import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    var formattedDate = DateFormat("EEEE d MMM").format(currentDate);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.red),
                  child: Image.asset(AppAssets.logo,)
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: Styles.date,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "You are on your journey",
                  style: Styles.journey,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(AppAssets.notification),
            )
          ],
        ),
      ),
    );
  }
}
