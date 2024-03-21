import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';

class Propertiescard extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? shareIcon;
  final bool? detailsList;
  final SvgPicture? svg;
  final String? title,details;
  final List<String>? episode;
  const Propertiescard({super.key, this.width, this.height, this.shareIcon=false, this.svg, this.title, this.details, this.detailsList=false, this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal:ResponsiveHelper.isTablet(context)?15.56: 15.56.w,vertical: 8.09.h),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.05000000074505806),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.44, color: Color(0xB284F729)),
          borderRadius: BorderRadius.circular(3.48),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          svg!,
          SizedBox(height: 9.12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: detailsList!?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${title}\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: episode!.length,
                      itemBuilder: (context, index) {
                        final episodeUrl = episode![index];
                        return Text(
                          "${index + 1}. $episodeUrl",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),// Add numbering and URL
                        );
                      },
                    )
                  ],
                )
                    :
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${title}\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '${details}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              shareIcon!? Assets.icons.share.svg():SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
