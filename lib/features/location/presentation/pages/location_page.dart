import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/features/location/presentation/bloc/location_bloc.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../../core/routes/route_path.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../../../home/presentation/widgets/location_card.dart';
import '../../domain/entities/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  final scrollController = ScrollController();

  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LocationFetchAll());
    setupScrollController(context);
  }

  void setupScrollController(context) {
    final LocationBloc castBloc = BlocProvider.of<LocationBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if(castBloc.state is LocationDisplaySuccess){
            BlocProvider.of<LocationBloc>(context).add(LocationFetchAll());
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
                  Container(
                    width: 1.0.sw,
                    padding: const EdgeInsets.only(top: 4, left: 4, right: 12, bottom: 4),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.40, color: Color(0xB284F729)),
                        borderRadius: BorderRadius.circular(23.79),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 12.h,
                            left: 12.w,
                            right: 8.w,
                            bottom: 12.h,
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFF13D8E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23.79),
                                bottomLeft: Radius.circular(23.79),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 56.w,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    color: Color(0xFFF2F2F2),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Assets.icons.dwon.svg(height: 20.sp)
                            ],
                          ),
                        ),
                        SizedBox(width: 24.w,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Search',
                                style: TextStyle(
                                  color: Color(0xFF858585),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Assets.icons.search.svg(height: 20.sp)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///main section
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: 24.h),
                              Text(
                                'All Locations',
                                style: TextStyle(
                                  color: Color(0xFF13D9E5),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              BlocConsumer<LocationBloc, LocationState>(
                                listener: (context, state) {
                                  if (state is LocationFailure) {
                                    Logger().e(state.error);
                                  }
                                },
                                builder: (context, state) {
                                  if (state is LocationLoading && state.isFirstFetch!) {
                                    return const Loader();
                                  }
                                  List<Location>?locations = [];
                                  bool isLoading = false;
                                  if (state is LocationLoading) {
                                    locations = state.oldLocations!;
                                    isLoading = true;
                                  } else if (state is LocationDisplaySuccess) {
                                    locations = state.locations!;
                                  }
                                  return Expanded(
                                    child:locations.isEmpty?Text("There has no data")
                                        :
                                    GridView.builder(
                                      controller: scrollController,
                                      padding: EdgeInsets.all(0),
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0.0.w,
                                          mainAxisSpacing: 24.0.h,
                                          childAspectRatio: 6/2,
                                          mainAxisExtent:ResponsiveHelper.isTablet(context)? 65:45
                                      ),
                                      itemCount: locations.length + (isLoading ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        if(index < locations!.length){
                                          return LocationCard(location: locations[index],index: index+1,);
                                        }
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
                          )
                      )
                  ),




                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}

