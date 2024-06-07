import 'package:fit_app/features/settings/presentation/views/widgets/edit_view_body.dart';
import 'package:flutter/material.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile"),centerTitle: true,),
      body: const EditViewBody(),
    );
  }
}