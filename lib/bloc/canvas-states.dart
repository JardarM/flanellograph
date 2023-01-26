import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/background.dart';

abstract class CanvasState extends Equatable {
  const CanvasState();
}

class SceneUpdateState extends CanvasState {
  final List<CanvasItem> items;
  final Item? selectedItem;
  final Item? background;

  SceneUpdateState(this.items, this.selectedItem, this.background);

  @override
  List<Object> get props => [background ?? Object(), selectedItem ?? Object(), ...items];
}

class LoadingSceneState extends CanvasState {
  @override
  List<Object?> get props => [];
}