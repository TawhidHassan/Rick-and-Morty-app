import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/common/widgets/Button/custom_button.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/config/color/custom_color.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widgets/character_card.dart';
import '../widgets/location_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        onTap: (){

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 137.h,
                    child: ListView(
                      scrollDirection:  Axis.horizontal,
                      children: [
                        CharacterCard(),
                        CharacterCard(),
                        CharacterCard(),
                      ],
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
                        onTap: (){

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 137.h,
                    child: ListView(
                      scrollDirection:  Axis.horizontal,
                      children: [
                        CharacterCard(),
                        CharacterCard(),
                        CharacterCard(),
                      ],
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
                        onTap: (){

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 46.h,
                    child: ListView(
                      scrollDirection:  Axis.horizontal,
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
                        onTap: (){

                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                    width: 1.0.sw,
                    height: 46.h,
                    child: ListView(
                      scrollDirection:  Axis.horizontal,
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
