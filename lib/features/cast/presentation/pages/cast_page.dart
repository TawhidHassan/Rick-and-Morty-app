import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../home/domain/entities/character.dart';
import '../../../home/presentation/bloc/local/local_bloc.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../bloc/cast/cast_bloc.dart';
import '../bloc/localCast/local_cast_bloc.dart';
import '../component/cast_component.dart';
import '../component/favourite_cast_component.dart';
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
                  FavouireCastComponent()
                      :
                  CastComponent(scrollController: scrollController,)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
