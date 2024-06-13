import 'package:fit_app/features/settings/presentation/views/widgets/custom_divided.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_item_like.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/selected_like_item.dart';
import 'package:flutter/material.dart';

class CustomRowOfLike extends StatefulWidget {
  const CustomRowOfLike({super.key});

  @override
  State<CustomRowOfLike> createState() => _CustomRowOfLikeState();
}

class _CustomRowOfLikeState extends State<CustomRowOfLike> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
            visible: isSelected,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SelectedLikeItem(text: "1 Like"),
            )),
        const CustomDivided(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSelected
                  ? SelectedLikeItem(
                      text: "Like",
                      onTap: () {
                        isSelected = !isSelected;
                        setState(() {});
                      },
                    )
                  : CustomItemLike(
                      onTap: () {
                        isSelected = !isSelected;
                        setState(() {});
                      },
                      text: "Like",
                      icon: Icons.thumb_up,
                    ),
              const CustomItemLike(
                text: "comment",
                icon: Icons.comment,
              ),
              const CustomItemLike(
                text: "share",
                icon: Icons.share,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
