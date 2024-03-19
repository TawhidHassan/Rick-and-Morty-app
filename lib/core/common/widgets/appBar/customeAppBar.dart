import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_assets/assets.gen.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          toolbarHeight: 65.h,
          backgroundColor:Colors.white.withOpacity(0.05000000074505806),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white.withOpacity(0.00000000074505806),
          ),
          centerTitle: true,
          title: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Assets.images.logo.svg(height: 48.h)),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.white.withOpacity(0.30000001192092896),
        )
      ],
    );
  }
}
