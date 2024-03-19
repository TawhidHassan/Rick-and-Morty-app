import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/config/color/custom_color.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    // TODO: implement initState

    Timer(Duration(seconds: 2), () {
      context.goNamed(Routes.mainPage);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0.sh,
      width: 1.0.sw,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: CustomColor.kPrimaryColorx,
        image: DecorationImage(
          image: Assets.images.splashOverlay.provider(),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Assets.images.splash.image(),
          ),

          Column(
            children: [
              Assets.icons.loading.image(),
              SizedBox(height: 12.h,),
              Text(
                'Loading',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF191D29),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(height: 24.h,)
        ],
      ),
    );
  }
}
