
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rick_and_morty/core/network/api_services.dart';
import 'package:rick_and_morty/features/cast%20details/domain/usecase/get_character_details.dart';
import 'package:rick_and_morty/features/cast/presentation/bloc/localCast/local_cast_bloc.dart';
import 'package:rick_and_morty/features/home/domain/usecase/remove_loacal_character.dart';
import 'package:rick_and_morty/features/home/domain/usecase/save_loacal_character.dart';
import 'package:rick_and_morty/features/cast%20details/presentation/bloc/cast_details_bloc.dart';
import 'package:rick_and_morty/features/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/features/home/data/repositoris/home_repository_impl.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/features/home/domain/usecase/get_all_local_characters.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/local/local_bloc.dart';

import '../core/local_storage/database_manager.dart';
import '../core/network/connection_checker.dart';
import '../features/cast/presentation/bloc/cast/cast_bloc.dart';
import '../features/home/data/datasource/home_local_data_source.dart';
import '../features/home/domain/usecase/get_all_characters.dart';
import '../features/home/presentation/bloc/home/home_bloc.dart';

part 'init_dependencies.main.dart';
