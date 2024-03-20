part of 'local_bloc.dart';

@immutable
abstract class LocalEvent {}
final class CharacetersFetchHome extends LocalEvent {}
final class SaveCharacter extends LocalEvent {
  final Character? character;
  SaveCharacter( {
    this.character,
  });
}
final class RemoveCharacter extends LocalEvent {
  final int? id;
  RemoveCharacter( {
    this.id,
  });
}