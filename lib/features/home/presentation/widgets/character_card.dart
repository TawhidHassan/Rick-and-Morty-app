import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/common/widgets/loader.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/local/local_bloc.dart';

import '../../../../core/config/color/custom_color.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../../core/routes/route_path.dart';
import '../../../cast details/presentation/bloc/cast_details_bloc.dart';
import '../../../cast/presentation/bloc/localCast/local_cast_bloc.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final double? width;
  final Character? character;
  final bool? isLocal;
  final CharacterLocal? characterLocal;
  const CharacterCard({super.key, this.width, this.character, this.isLocal=false, this.characterLocal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [


        Container(
          width:ResponsiveHelper.isTablet(context)? 260:null,
          margin: EdgeInsets.only(right: 14.81.w),
          padding:EdgeInsets.symmetric(horizontal:ResponsiveHelper.isTablet(context)? 12.41:7.41,vertical: 7.41),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:Assets.images.characterbg.provider(),
                  fit:ResponsiveHelper.isTablet(context)?BoxFit.fill: BoxFit.contain
              )
          ),
          child: InkWell(
            onTap: (){
              context.pushNamed(Routes.CastDtailsPage,extra:isLocal!? characterLocal!.id!: character!.id!);
            },
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
                      margin: EdgeInsets.only(top:width==null?7.41.h:0,bottom:width==null? 9.h:0 ),
                      width:ResponsiveHelper.isTablet(context)?500.w:width??null,
                      height:ResponsiveHelper.isTablet(context)?200.h:99.97.h,
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
                    fontSize:ResponsiveHelper.isTablet(context)?6.sp: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h,),
              ],
            ),
          ),
        ),
        Positioned(
            left:ResponsiveHelper.isTablet(context)?18: 15,
            top:ResponsiveHelper.isTablet(context)?18: width!=null?14.97:22,
            child: BlocBuilder<LocalBloc, LocalState>(
            builder: (context, state) {
              if(state is HomeLocalCharactersDisplaySuccess){
                if(state.characters!.where((element) => element.id==(isLocal!?characterLocal!.id:character!.id!)).toList().isNotEmpty){
                  return InkWell(
                      onTap: (){
                        context.read<LocalBloc>().add(RemoveCharacter(id: (isLocal!?characterLocal!.id:character!.id!)));
                        context.read<LocalBloc>().add(CharacetersFetchHome());
                        context.read<LocalCastBloc>().add(LocalCastFetch());
                      },
                      child: Assets.icons.favourite.svg(width: width!=null?ResponsiveHelper.isTablet(context)?24.w:null:24.w,height: width!=null?ResponsiveHelper.isTablet(context)?24.h:null:24.h));
                }
                return  InkWell(
                    onTap: (){
                        context.read<LocalBloc>().add(SaveCharacter(character: character!));
                        context.read<LocalBloc>().add(CharacetersFetchHome());
                        context.read<LocalCastBloc>().add(LocalCastFetch());
                    },
                    child: Assets.icons.unFavourite.svg(width: width!=null?null:24.w,height: width!=null?ResponsiveHelper.isTablet(context)?24.h:null:24.h));
              }
              return Assets.icons.unFavourite.svg(width: width!=null?null:24.w,height: width!=null?ResponsiveHelper.isTablet(context)?24.h:null:24.h);
            },
          )
        ),
      ],
    );
  }
}
