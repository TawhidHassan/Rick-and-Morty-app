import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderButtonWithoutIcon extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? tap;

  const BorderButtonWithoutIcon({Key? key, required this.text, this.color=Colors.blueAccent, required this.tap, this.textColor=Colors.blueAccent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(
            color: color,
          ),
        ),
        child: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.enhance_photo_translate_outlined,color: textColor,),
                SizedBox(width: 8.w,),
                Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 14.sp),)
              ],
            )
        ),
      ),
    );
  }
}
