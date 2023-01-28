
import 'package:equatable/equatable.dart';

abstract class SceneEvent extends Equatable{
}

class LoadingScenesEvent extends SceneEvent{
  @override
  List<Object?> get props => [];
}
