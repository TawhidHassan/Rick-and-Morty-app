import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';

class LocationCard extends StatelessWidget {
  final int? index;
  final bool? isLocation;
  final Location? location;
  final Episode? episode;
  const LocationCard({super.key, this.location, this.index, this.isLocation=true, this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177.w,
      margin: EdgeInsets.only(right: 24.w),
      padding:  EdgeInsets.symmetric(horizontal: 11.92.w,vertical: 4.92.h),
      decoration: BoxDecoration(
          image: DecorationImage(
              image:Assets.images.locationbg.provider(),
              fit: BoxFit.fill
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isLocation!?'#${index}':episode!.episode??"",
            style: TextStyle(
              color: Colors.white,
              fontSize:ResponsiveHelper.isTablet(context)? 6.sp:10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            isLocation!?
            location!.name!.length>15?location!.name!.substring(0,13)+"..":location!.name!
            :
            episode!.name!.length>15?episode!.name!.substring(0,8)+"..":episode!.name!,
            style: TextStyle(
              color: Colors.white,
              fontSize:ResponsiveHelper.isTablet(context)? 6.sp:13.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
