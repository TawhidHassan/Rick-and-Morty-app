
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../home/domain/entities/character.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../bloc/cast/cast_bloc.dart';

class CastComponent extends StatelessWidget {
  final  ScrollController? scrollController;
  const CastComponent({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CastBloc, CastState>(
      listener: (context, state) {
        if (state is CastFailure) {
          // Logger().e(state.error);
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
              crossAxisCount:ResponsiveHelper.isTablet(context)?3: 2,
              crossAxisSpacing:ResponsiveHelper.isTablet(context)?10.0.w: 27.64.w,
              mainAxisSpacing:ResponsiveHelper.isTablet(context)?65.0.h: 24.0.h,
              childAspectRatio: 6/(ResponsiveHelper.isTablet(context)?4:6),
            ),
            itemCount: characters.length + (isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if(index < characters!.length){
                return CharacterCard(character: characters[index],);}
              else{
                Timer(Duration(milliseconds: 30), () {
                  scrollController!
                      .jumpTo(scrollController!.position.maxScrollExtent);
                });
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        );


      },
    );
  }
}
