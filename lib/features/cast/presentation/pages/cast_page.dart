import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/features/cast/presentation/bloc/cast_bloc.dart';

import '../../../../core/common/entities/enums.dart';
import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../home/domain/entities/character.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../widgets/search_bar.dart';

class CastPage extends StatefulWidget {
  const CastPage({super.key});

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  final scrollController = ScrollController();

  void initState() {
    super.initState();
    setupScrollController(context);
    context.read<CastBloc>().add(CastFetchAll(status: '',search: ''));

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
                  CustomeSearchBar(),
                  // SearchBar(),

                  ///main section
                  SizedBox(height: 24.h),
                  Text(
                    'All Cast',
                    style: TextStyle(
                      color: Color(0xFF13D9E5),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
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
