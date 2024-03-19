import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/color/custom_color.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? chid;
  const BackgroundContainer({super.key, this.chid});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: 1.0.sh,
      decoration: BoxDecoration(
        color: CustomColor.primaryDarkColor,
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Container(
              width: 1.0.sw,
              height: 1.0.sh,
              child: Stack(
                children: [
                  Positioned(
                    left: -0,
                    top: 0,
                    child: Container(
                      width: 1.0.sw,
                      height: 1.0.sh,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.images.bg.provider(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 1.0.sw,
                      height: 1.0.sh,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(-0.21, 0.50),
                          radius: 2.08,
                          colors: [Color(0x00D9D9D9), Color(0xFF191D29)],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          chid!
        ],
      ),
    );
  }
}
