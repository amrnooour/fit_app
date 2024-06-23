import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_item_post.dart';
import 'package:flutter/material.dart';

class ThroughtViewBody extends StatelessWidget {
  const ThroughtViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomItemPost(
            imageUrl: Constants.networkImage1,
          ),
          SizedBox(
            height: 15,
          ),
          CustomItemPost(
            videoUrl: AppAssets.loginVideo,
          ),
          SizedBox(
            height: 15,
          ),
          CustomItemPost(),
          SizedBox(
            height: 15,
          ),
          CustomItemPost(
            audioUrl: "audio1.mp3",
          )
        ],
      ),
    );
  }
}
