import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/util/text_style.dart';
import '../loader.dart';


class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool? boder;
  final bool? loading;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? onTap;
        CustomButton({ this.title, this.color, this.textColor, this.onTap,Key? key, this.boder=false, this.height=48, this.width, this.borderRadius, this.textSize, this.loading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:width!.h,
        height:height!.h,
        decoration:boder!? BoxDecoration(
          border: Border.all(color: color!),
          borderRadius: BorderRadius.circular(borderRadius??10.r),
        ):BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius??10.r),
        ),
        child: Center(
          child: loading!?Loader():Text(title!,
            style: semiBoldText(textSize??16.sp,color:boder!? color!: textColor!),
              textScaleFactor: 1.0),
        ),
      ),
    );
  }
}
