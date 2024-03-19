import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom_assets/assets.gen.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177.w,
      height: 46.h,
      margin: EdgeInsets.only(right: 24.w),
      padding:  EdgeInsets.symmetric(horizontal: 11.92.w,vertical: 4.92.h),
      decoration: BoxDecoration(
          image: DecorationImage(
              image:Assets.images.locationbg.provider(),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Earth (C-137)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
