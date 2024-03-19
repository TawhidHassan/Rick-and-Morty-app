import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/exceptions.dart';
import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final ConnectionChecker connectionChecker;
  HomeRepositoryImpl(
    this.homeRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Character>>> getAllcharacters()async {
    // TODO: implement getAllcharacters
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final characters = await homeRemoteDataSource.getAllCharacters();
        return right(characters!.results!);
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }



  // @override
  // Future<Either<Failure, List<Blog>>> getAllBlogs() async {
  //   try {
  //     if (!await (connectionChecker.isConnected)) {
  //       final blogs = blogLocalDataSource.loadBlogs();
  //       return right(blogs);
  //     }
  //     final blogs = await blogRemoteDataSource.getAllBlogs();
  //     blogLocalDataSource.uploadLocalBlogs(blogs: blogs);
  //     return right(blogs);
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }
}
