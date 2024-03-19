import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/widgets/character_card.dart';

class CastPage extends StatefulWidget {
  const CastPage({super.key});

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CharacetersFetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      chid: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///Search Bar
                  Container(
                    width: 1.0.sw,
                    padding: const EdgeInsets.only(
                        top: 4, left: 4, right: 12, bottom: 4),
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
                              Assets.icons.dwon.svg()
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
                              Assets.icons.search.svg()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

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
                  BlocConsumer<HomeBloc, HomeState>(
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
                       return GridView.builder(
                         padding: EdgeInsets.all(0),
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 27.64.w,
                           mainAxisSpacing: 24.0.h,
                         ),
                         itemCount: state.characters!.length,
                         itemBuilder: (context, index) {
                           return CharacterCard(character: state.characters![index],);
                         },
                       );
                     }else{
                       return const Text("Some Things wrong");
                     }

                    },
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
