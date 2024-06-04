import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      var token = CacheHelper().getData(key: Constants.token);
      token ==null?customReplacementNavigate(context, "/loginView") :
      customReplacementNavigate(context, "/homeView");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splash,
      fit: BoxFit.cover,
    );
  }
}
