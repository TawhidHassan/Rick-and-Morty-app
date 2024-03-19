
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/widgets/Button/custom_button.dart';
import '../../../core/config/color/custom_color.dart';
import '../../../core/routes/route_path.dart';



class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Error Page"),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.lottie.error.lottie(height: 100.h),
            const Text("Something wrong, Please \ncheck your internet connection",textAlign: TextAlign.center,),
            SizedBox(height: 8.h,),
            CustomButton(
              textSize: 12,
              height: 42,
              width: 200,
              textColor: CustomColor.kPrimaryColorx,
              title: "Refers",
              color: Colors.orange,
              onTap: (){
                context.goNamed(Routes.mainPage);
              },
            )
          ],
        ),
      ),


    );
  }
}
