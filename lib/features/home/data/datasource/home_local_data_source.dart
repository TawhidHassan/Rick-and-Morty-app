

import 'package:logger/logger.dart';
import 'package:rick_and_morty/core/local_storage/database_manager.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class HomeLocalDataSource {
  Future<CharacterLocal?> uploadLocalCharacters({required CharacterLocal characterLocal});
  Future<CharacterLocal?> removeLocalCharacters({required int id});
  Future<List<CharacterLocal>> loadCharacters();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final DBHelper? dbHelper;
  HomeLocalDataSourceImpl({this.dbHelper});

  @override
  Future<List<CharacterLocal>> loadCharacters()async {
    List<CharacterLocal> charatcters = [];
    try{
      await dbHelper!.fetchAllProducts().then((value){
        if(value!=null&&value.isNotEmpty){
          charatcters=value;
        }else{
          charatcters=[];

        }
      });
      Logger().w(charatcters.length);
      return charatcters;
    }catch (e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CharacterLocal?> uploadLocalCharacters({required CharacterLocal characterLocal}) async{
    try{
     var result=await dbHelper!.addCast(
          CharacterLocal(
            name: characterLocal.name??"",
            image:characterLocal.image??"",
            id: characterLocal.id,
            status: characterLocal.status??""
          )
      );

     Logger().e(result);
     return characterLocal;
    }catch (e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CharacterLocal?> removeLocalCharacters({required int id})async {
    // TODO: implement removeLocalCharacters
    try{
      var result=await dbHelper!.deleteProduct(id);
      Logger().e(result);
      return null;
    }catch (e){
      throw ServerException(e.toString());
    }
  }

}
