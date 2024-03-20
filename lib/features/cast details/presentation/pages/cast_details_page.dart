import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/core/common/widgets/Button/custom_button.dart';
import 'package:rick_and_morty/core/config/color/custom_color.dart';
import 'package:rick_and_morty/features/cast%20details/presentation/bloc/cast_details_bloc.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/local_storage/database_manager.dart';
import '../../../home/presentation/bloc/local/local_bloc.dart';
import '../widgets/propertis_card.dart';

class CastDetailsPage extends StatelessWidget {
  final int? id;
  const CastDetailsPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    context.read<CastDetailsBloc>().add(CastDetailsFetch(id: id!));
    return BackgroundContainer(
      chid: Column(
        children: [
          CustomeAppBar(),

          Expanded(
            child: BlocConsumer<CastDetailsBloc, CastDetailsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is CastDetailsLoading){
                return Loader();
              }
              if(state is CastDetailsFailure){
                return Text(state.error);
              }
              if(state is CastDetailsDisplaySuccess){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h,),
                        Text(
                          state.character!.name??"",
                          style: TextStyle(
                            color: Color(0xFF13D9E5),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          width: 240.w,
                          height: 240.h,
                          padding: const EdgeInsets.all(30),
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.05000000074505806),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.60.w, color: Color(0xB284F729)),
                              borderRadius: BorderRadius.circular(4.80.r),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl:state.character!.image??"",
                                placeholder: (context, url) => Loader(),
                                errorWidget: (context, url, error){
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Assets.images.logo.svg(),
                                  );
                                },
                                imageBuilder: (context, image) =>  Container(
                                  width: 180.w,
                                  height: 180.h,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: image,
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.80.r),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        InkWell(
                          onTap: (){

                            },
                            child: BlocBuilder<LocalBloc, LocalState>(
                            builder: (context, state) {
                              if(state is HomeLocalCharactersDisplaySuccess){
                                if(state.characters!.where((element) => element.id==id!).toList().isNotEmpty){
                                  return InkWell(
                                      onTap: (){
                                        context.read<LocalBloc>().add(RemoveCharacter(id: id));
                                        context.read<LocalBloc>().add(CharacetersFetchHome());
                                      },
                                      child: Icon(Icons.favorite,color: CustomColor.kPrimaryColorx,));
                                }
                                return  InkWell(
                                    onTap: (){
                                      final CastDetailsBloc castDetailsBloc = BlocProvider.of<CastDetailsBloc>(context);
                                      if(castDetailsBloc.state is CastDetailsDisplaySuccess){
                                        final currentState = castDetailsBloc.state as CastDetailsDisplaySuccess;
                                        context.read<LocalBloc>().add(SaveCharacter(character: currentState.character!));
                                        context.read<LocalBloc>().add(CharacetersFetchHome());
                                      }
                                    },
                                    child: Icon(Icons.favorite_outline));
                              }
                              return SizedBox();

                            },
                          )),
                        SizedBox(height: 16.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Propertiescard(
                                  svg: Assets.icons.heart.svg(),
                                  title: "Status",
                                  details: state.character!.status??"",
                                )
                            ),
                            Expanded(
                                child: Propertiescard(
                                  svg: Assets.icons.android.svg(),
                                  title: "Species",
                                  details: state.character!.species??"",
                                )
                            ),
                            Expanded(
                                child: Propertiescard(
                                  svg: Assets.icons.gender.svg(),
                                  title: "Gender",
                                  details: state.character!.gender??"",
                                )
                            ),
                          ],
                        ),

                        SizedBox(height: 15.h,),
                        Propertiescard(
                          width: 1.0.sw,
                          shareIcon: true,
                          svg: Assets.icons.earth.svg(),
                          title: "Origin",
                          details: state.character!.origin!.name??"",
                        ),
                        SizedBox(height: 16.h,),
                        Propertiescard(
                          width: 1.0.sw,
                          shareIcon: true,
                          svg: Assets.icons.camera.svg(),
                          title: "Last Known Location",
                          details: state.character!.location!.name??"",
                        ),
                        SizedBox(height: 16.h,),
                        Propertiescard(
                          width: 1.0.sw,
                          svg: Assets.icons.list.svg(),
                          title: "Episode(s)",
                          detailsList: true,
                          episode: state.character!.episode!,
                          details: state.character!.episode!.toString()??"",
                        ),
                        SizedBox(height: 24.h,),
                      ],
                    ),
                  ),
                );
              }
              return Text("Some thing wrong");

                    },
                  ),
          ),

        ],
      ),
    );
  }
}
