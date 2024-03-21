import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../home/presentation/widgets/character_card.dart';
import '../bloc/localCast/local_cast_bloc.dart';
class FavouireCastComponent extends StatelessWidget {
  const FavouireCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalCastBloc, LocalCastState>(
      listener: (context, state) {
        if (state is LocalCastFailure) {
          // Logger().e(state.error);
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
                crossAxisCount:ResponsiveHelper.isTablet(context)?3: 2,
                crossAxisSpacing:ResponsiveHelper.isTablet(context)?10.0.w: 27.64.w,
                mainAxisSpacing:ResponsiveHelper.isTablet(context)?65.0.h: 24.0.h,
                childAspectRatio: 6/(ResponsiveHelper.isTablet(context)?4:6),
              ),
              itemCount: state.characters!.length,
              itemBuilder: (context, index) {
                return CharacterCard(isLocal: true,characterLocal:state.characters![index] );

              },
            ),
          );
        }return Text("Some things wrong");




      },
    );
  }
}




