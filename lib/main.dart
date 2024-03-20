import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/cast%20details/presentation/bloc/cast_details_bloc.dart';
import 'package:rick_and_morty/features/cast/presentation/bloc/cast_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/local/local_bloc.dart';

import 'Dependenci Injection/init_dependencies.dart';
import 'core/config/theme/app_themes.dart';
import 'core/routes/routes.dart';
import 'features/home/presentation/bloc/home/home_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();

  await initDependencies();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => serviceLocator<HomeBloc>(),
          ),
          BlocProvider(
            create: (_) => serviceLocator<CastBloc>(),
          ),
          BlocProvider(
            create: (_) => serviceLocator<CastDetailsBloc>(),
          ),BlocProvider(
            create: (_) => serviceLocator<LocalBloc>(),
          ),
        ],
        child: const MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Store',
        theme: CustomTheme.lightTheme,
        darkTheme:CustomTheme.darkTheme, // standard dark theme
        themeMode: ThemeMode.dark,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

