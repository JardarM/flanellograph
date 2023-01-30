
import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/scene.dart';
import 'package:flanellograf/models/scenes.dart';

abstract class SceneState extends Equatable{
}

class SceneUpdateState extends SceneState{
  final List<Scene> scenes;

  SceneUpdateState(this.scenes);

  @override
  List<Object?> get props => [...scenes];

  factory SceneUpdateState.empty(){
    return SceneUpdateState(List<Scene>.empty());
  }

}