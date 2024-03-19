import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/common/widgets/loader.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final double? width;
  final Character? character;
  const CharacterCard({super.key, this.width, this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14.81.w),
      padding: const EdgeInsets.symmetric(horizontal: 7.41,vertical: 7.41),
      decoration: BoxDecoration(
          image: DecorationImage(
              image:Assets.images.characterbg.provider(),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl:character!.image??"",
              placeholder: (context, url) => Loader(),
              errorWidget: (context, url, error){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Assets.images.logo.svg(),
                );
              },
              imageBuilder: (context, image) =>  Container(
                height: 99.97.h,
                margin: EdgeInsets.only(top:width==null?7.41.h:0,bottom:width==null? 9.h:0 ),
                width:width??null,
                decoration:  ShapeDecoration(
                    image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill
                    ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.75),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 6.h,),
          Text(
            character!.name??'Morty Smith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 6.h,),
        ],
      ),
    );
  }
}
