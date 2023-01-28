import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/scene.dart';

abstract class CanvasState extends Equatable {
  const CanvasState();
}

class SceneUpdateState extends CanvasState {
  final Item? selectedItem;
  final Scene scene;

  const SceneUpdateState(this.scene, this.selectedItem);

  @override
  List<Object> get props => [scene];
}

class LoadingSceneState extends CanvasState {
  @override
  List<Object?> get props => [];
}