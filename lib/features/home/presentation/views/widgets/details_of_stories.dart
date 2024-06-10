import 'package:fit_app/features/home/data/models/stories_details_model.dart';
import 'package:flutter/material.dart';

class DetailsOfStories extends StatelessWidget {
  final StoriesDetailsModel storiesDetailsModel;
  const DetailsOfStories({super.key, required this.storiesDetailsModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        
        Positioned(
          top: 0,
          child: Container(
            height: height*.6,
            width: width,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(.3),image: DecorationImage
            (image: NetworkImage(storiesDetailsModel.image),fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height*.6,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(storiesDetailsModel.image), fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(storiesDetailsModel.clientName),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          storiesDetailsModel.subTitle,
                          maxLines: 2,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              )
              ],
            ),
          ),
          ),
        )
      ],)
    );
  }
}