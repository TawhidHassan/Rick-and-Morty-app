import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/core/common/widgets/Button/custom_button.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/local/local_bloc.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/config/color/custom_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/local_storage/database_manager.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/character_card.dart';
import '../widgets/location_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CharacetersFetchAll());
    context.read<LocalBloc>().add(CharacetersFetchHome());

  }
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      chid: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(),
            SizedBox(height: 40.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Favourites',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomButton(
                        width: 88,
                        height: 26,
                        color: CustomColor.kPrimaryColorx,
                        textColor: Color(0xFF191D29),
                        textSize: 13.sp,
                        title: "View all",
                        onTap: () {

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 137.h,
                    child: BlocConsumer<LocalBloc, LocalState>(
                      listener: (context, state) {
                        if (state is CharactersLocalFailure) {
                          Logger().e(state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is CharactersLocalLoading) {
                          return const Loader();
                        }if (state is CharactersLocalFailure) {
                          return Text(state.error);
                        }
                        if(state is HomeLocalCharactersDisplaySuccess){
                          return state.characters!.isEmpty?
                          Assets.lottie.empty.lottie()
                              :
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.characters!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CharacterCard(width: 119.41.w,isLocal: true,characterLocal: state.characters![index],);
                            },
                          );
                        }else{
                          return const Text("Some Things wrong");
                        }

                      },
                    ),
                  )
                ],
              ),
            ),

            ///Meet The Cast
            SizedBox(height: 42.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meet the cast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomButton(
                        width: 88,
                        height: 26,
                        color: CustomColor.kPrimaryColorx,
                        textColor: Color(0xFF191D29),
                        textSize: 13.sp,
                        title: "View all",
                        onTap: () {

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 137.h,
                    child: BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state is CharactersFailure) {
                          Logger().e(state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is CharactersLoading) {
                          return const Loader();
                        }
                        if(state is CharactersDisplaySuccess){
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return CharacterCard(width: 119.41.w,character: state.characters![index],);
                            },
                          );
                        }else{
                          return const Text("Some Things wrong");
                        }

                      },
                    ),
                  )
                ],
              ),
            ),


            ///Location
            SizedBox(height: 42.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Locations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomButton(
                        width: 88,
                        height: 26,
                        color: CustomColor.kPrimaryColorx,
                        textColor: Color(0xFF191D29),
                        textSize: 13.sp,
                        title: "View all",
                        onTap: () {

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 46.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        LocationCard(),
                        LocationCard(),
                        LocationCard(),

                      ],
                    ),
                  )
                ],
              ),
            ),

            ///Episodes
            SizedBox(height: 42.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Episodes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomButton(
                        width: 88,
                        height: 26,
                        color: CustomColor.kPrimaryColorx,
                        textColor: Color(0xFF191D29),
                        textSize: 13.sp,
                        title: "View all",
                        onTap: () {

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 46.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        LocationCard(),
                        LocationCard(),
                        LocationCard(),

                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 24.h,)
          ],
        ),
      ),
    );
  }
}
