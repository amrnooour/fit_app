import 'package:fit_app/features/settings/presentation/views/widgets/custom_divided.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_info_edit_profile.dart';
import 'package:flutter/material.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 20,),
        CustomDivided(),
        CustomInfoEditProfile(),
      ],),
    );
  }
}