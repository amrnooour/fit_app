import 'package:fit_app/core/utils/styles.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_button_show_more.dart';
import 'package:flutter/material.dart';

class CustomColumnOfText extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomColumnOfText(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Styles.journey,
                maxLines: 2,
              ),
              const Spacer(),
              const Text(
                "see More",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              const CustomButtonShowMore(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(subTitle, style: Styles.date),
        ],
      ),
    );
  }
}
