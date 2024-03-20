import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../../core/common/entities/enums.dart';
import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../home/domain/entities/character.dart';
import '../../../home/presentation/bloc/local/local_bloc.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../bloc/cast/cast_bloc.dart';
import '../bloc/localCast/local_cast_bloc.dart';
import '../widgets/favorite_search_bar.dart';
import '../widgets/search_bar.dart';

class CastPage extends StatefulWidget {
  final bool isFavouritePage;
  const CastPage({super.key, this.isFavouritePage=false});

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  final scrollController = ScrollController();

  void initState() {
    super.initState();
    setupScrollController(context);

  }
  void setupScrollController(context) {
    final CastBloc castBloc = BlocProvider.of<CastBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if(castBloc.state is CastDisplaySuccess){
            final currentState = castBloc.state as CastDisplaySuccess;
            BlocProvider.of<CastBloc>(context).add(CastFetchAll(search:currentState.search,status: currentState.status ));
          }
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(widget.isFavouritePage){
      context.read<LocalCastBloc>().add(LocalCastFetch(search: '',status: ''));
    }else{
      context.read<CastBloc>().add(CastFetchAll(status: '',search: ''));
    }
    return BackgroundContainer(
      chid: Column(
        children: [
          CustomeAppBar(),

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///Search Bar
                  widget.isFavouritePage?
                  CustomeFavouriteSearchBar()
                  :
                  CustomeSearchBar(),
                  // SearchBar(),

                  ///main section
                  SizedBox(height: 24.h),
                  Text(
                    widget.isFavouritePage?"Favourites":'All Cast',
                    style: TextStyle(
                      color: Color(0xFF13D9E5),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  widget.isFavouritePage?
                  BlocConsumer<LocalCastBloc, LocalCastState>(
                    listener: (context, state) {
                      if (state is LocalCastFailure) {
                        Logger().e(state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is LocalCastLoading) {
                        return const Loader();
                      }
                      if(state is LocalCastDisplaySuccess){
                        return Expanded(
                          child: state.characters!.isEmpty?
                          Assets.lottie.empty.lottie()
                              :
                          GridView.builder(
                            padding: EdgeInsets.all(0),
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 27.64.w,
                              mainAxisSpacing: 24.0.h,
                            ),
                            itemCount: state.characters!.length,
                            itemBuilder: (context, index) {
                                return CharacterCard(isLocal: true,characterLocal:state.characters![index] );

                            },
                          ),
                        );
                      }return Text("Some things wrong");




                    },
                  )
                      :
                  BlocConsumer<CastBloc, CastState>(
                    listener: (context, state) {
                      if (state is CastFailure) {
                        Logger().e(state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is CastLoading && state.isFirstFetch!) {
                        return const Loader();
                      }
                      List<Character>?characters = [];
                      bool isLoading = false;
                      if (state is CastLoading) {
                        characters = state.oldCharacters!;
                        isLoading = true;
                      } else if (state is CastDisplaySuccess) {
                        characters = state.characters!;
                      }
                       return Expanded(
                         child:characters.isEmpty?Text("There has no data")
                             :
                         GridView.builder(
                           controller: scrollController,
                           padding: EdgeInsets.all(0),
                           // physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             crossAxisSpacing: 27.64.w,
                             mainAxisSpacing: 24.0.h,
                           ),
                           itemCount: characters.length + (isLoading ? 1 : 0),
                           itemBuilder: (context, index) {
                            if(index < characters!.length){
                             return CharacterCard(character: characters[index],);}
                            else{
                              Timer(Duration(milliseconds: 30), () {
                                scrollController
                                    .jumpTo(scrollController.position.maxScrollExtent);
                              });
                              return Center(child: CircularProgressIndicator(),);
                            }
                           },
                         ),
                       );


                    },
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
