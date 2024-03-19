
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rick_and_morty/core/network/api_services.dart';
import 'package:rick_and_morty/features/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/features/home/data/repositoris/home_repository_impl.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/features/home/presentation/bloc/home_bloc.dart';

import '../core/network/connection_checker.dart';
import '../features/home/domain/usecase/get_all_characters.dart';

part 'init_dependencies.main.dart';
