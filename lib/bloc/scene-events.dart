
import 'package:equatable/equatable.dart';

abstract class SceneEvent extends Equatable{
}

class LoadingScenesEvent extends SceneEvent{
  @override
  List<Object?> get props => [];
}

class SearchScenesEvent extends SceneEvent{

  final String searchToken;

  SearchScenesEvent(this.searchToken);

  @override
  List<Object?> get props => [searchToken];

}