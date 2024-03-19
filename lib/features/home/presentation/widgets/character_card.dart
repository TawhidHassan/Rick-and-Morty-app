import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom_assets/assets.gen.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.h,
      width: 137.w,
      margin: EdgeInsets.only(right: 14.81.w),
      padding: const EdgeInsets.all(7.41),
      decoration: BoxDecoration(
          image: DecorationImage(
              image:Assets.images.characterbg.provider(),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 99.97.h,
              width: 119.41.w,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/119x100"),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.75),
                ),
              ),
            ),
          ),
          SizedBox(height: 6.h,),
          Text(
            'Morty Smith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
