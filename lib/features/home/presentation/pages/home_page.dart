import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/core/common/widgets/Button/custom_button.dart';
import 'package:rick_and_morty/features/episode/presentation/bloc/episode_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/local/local_bloc.dart';
import 'package:rick_and_morty/features/location/presentation/bloc/location_bloc.dart';

import '../../../../core/common/widgets/Background/background.dart';
import '../../../../core/common/widgets/appBar/customeAppBar.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/config/color/custom_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/ResponsiveHelper.dart';
import '../../../../core/routes/route_path.dart';
import '../bloc/home/home_bloc.dart';
import '../component/episode_component.dart';
import '../component/favourite_component.dart';
import '../component/location_component.dart';
import '../component/meet_cast_component.dart';
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
    context.read<LocationBloc>().add(LocationFetchAll());
    context.read<EpisodeBloc>().add(EpisodeFetchAll());
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      chid: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(),

            ///Favourites
            FavouriteComponent(),

            ///Meet The Cast
            MeetCastComponent(),

            ///Location
            LocationComponent(),

            ///Episodes
            EpisodeComponent(),

            SizedBox(height: 24.h,)
          ],
        ),
      ),
    );
  }
}
