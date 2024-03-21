import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/config/color/custom_color.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../../core/routes/route_path.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/character_card.dart';

class MeetCastComponent extends StatelessWidget {
  const MeetCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    width:ResponsiveHelper.isTablet(context)? 120:88,
                    height:ResponsiveHelper.isTablet(context)? 32:26,
                    color: CustomColor.kPrimaryColorx,
                    textColor: Color(0xFF191D29),
                    textSize: 13,
                    borderRadius: 8.r,
                    title: "View all",
                    onTap: () {
                      context.goNamed(Routes.CastPage,extra: false);
                    },
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              SizedBox(
                width: 1.0.sw,
                height:ResponsiveHelper.isTablet(context)?250.h: 137.h,
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is CharactersFailure) {
                      // Logger().e(state.error);
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
      ],
    );
  }
}
