import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/common/widgets/loader.dart';

import '../../../../core/common/entities/enums.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../bloc/cast/cast_bloc.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height:ResponsiveHelper.isTablet(context)?70.h : 50.h,
      padding: const EdgeInsets.only(
          top: 4, left: 4, right: 12, bottom: 4),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10000000149011612),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.40, color: Color(0xB284F729)),
          borderRadius: BorderRadius.circular(23.79.r),
        ),
      ),
      child: BlocBuilder<CastBloc, CastState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PopupMenuButton(
                // color: Color(0xFF13D8E5),
                offset: Offset(-10, 30),
                itemBuilder: (BuildContext context) {
                  return CharacterStatus.values.map((e) => e.name)
                      .toList()
                      .map((e) =>
                      PopupMenuItem(
                        onTap: () {
                          if(state is CastDisplaySuccess){
                            if(e=="all"){
                              context.read<CastBloc>().add(CastFetchAll(status: '',search: state.search));
                            }else{
                              context.read<CastBloc>().add(CastFetchAll(status: e,search: state.search));

                            }
                          }
                        },
                        child: Text('$e', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800
                        ),),
                      )
                  ).toList();
                },
                child: Container(
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
                        topLeft: Radius.circular(23.79.r),
                        bottomLeft: Radius.circular(23.79.r),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<CastBloc, CastState>(
                        builder: (context, state) {
                          if (state is CastLoading) {
                            return SizedBox(
                                height: 14,
                                width: 14,
                                child: Loader());
                          }
                          if (state is CastDisplaySuccess) {
                            return SizedBox(
                              width: 56.w,
                              child: Text(
                                state.status==''?"Status":state.status!,
                                style: TextStyle(
                                  color: Color(0xFFF2F2F2),
                                  fontSize:ResponsiveHelper.isTablet(context)?6.sp: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            width: 56.w,
                            child: Text(
                              'Status',
                              style: TextStyle(
                                color: Color(0xFFF2F2F2),
                                fontSize:ResponsiveHelper.isTablet(context)?6.sp: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 8.w),
                      Assets.icons.dwon.svg(height: 20.sp)
                    ],
                  ),
                ),
              ),
              SizedBox(width: 24.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(

                        onSubmitted: (value){
                          if(state is CastDisplaySuccess){
                            context.read<CastBloc>().add(
                                CastFetchAll(status: state.status, search:value));
                          }
                          FocusScope.of(context).unfocus();

                        },

                        style: TextStyle(
                          fontSize:ResponsiveHelper.isTablet(context)?6.sp: 13.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Color(0xFF858585),
                            fontSize:ResponsiveHelper.isTablet(context)?6.sp: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Assets.icons.search.svg(height:ResponsiveHelper.isTablet(context)?8.sp: 20.sp)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
