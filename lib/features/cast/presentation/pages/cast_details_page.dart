import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class CastDetailsPage extends StatelessWidget {
  const CastDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      chid: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(),


          ],
        ),
      ),
    );
  }
}
