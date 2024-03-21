import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/common/widgets/loader.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../../core/routes/route_path.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final double? width;
  final Character? character;
  final bool? isLocal;
  final CharacterLocal? characterLocal;
  const CharacterCard({super.key, this.width, this.character, this.isLocal=false, this.characterLocal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.CastDtailsPage,extra:isLocal!? characterLocal!.id!: character!.id!);
      },
      child: Container(
        width:ResponsiveHelper.isTablet(context)? 500:null,
        margin: EdgeInsets.only(right: 14.81.w),
        padding:EdgeInsets.symmetric(horizontal:ResponsiveHelper.isTablet(context)? 12.41:7.41,vertical: 7.41),
        decoration: BoxDecoration(
            image: DecorationImage(
                image:Assets.images.characterbg.provider(),
                fit:ResponsiveHelper.isTablet(context)?BoxFit.fill: BoxFit.contain
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl:isLocal!?characterLocal!.image??"":character!.image??"",
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Assets.images.logo.svg(),
                  );
                },
                imageBuilder: (context, image) =>  Container(
                  height:ResponsiveHelper.isTablet(context)?200.h:99.97.h,
                  margin: EdgeInsets.only(top:width==null?7.41.h:0,bottom:width==null? 9.h:0 ),
                  width:ResponsiveHelper.isTablet(context)?500.w:width??null,
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
              isLocal!?characterLocal!.name??'Name not found'
                  :
              character!.name??'Name not found',
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
      ),
    );
  }
}
