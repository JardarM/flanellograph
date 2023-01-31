import 'dart:typed_data';
import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/resourceitem.dart';
import 'package:flanellograf/models/scene.dart';

abstract class CanvasEvent extends Equatable {
  const CanvasEvent();
}

class LoadSceneEvent extends CanvasEvent {
  final String id;

  const LoadSceneEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class SaveSceneEvent extends CanvasEvent{
  final String id;
  final Uint8List? imageData;

  const SaveSceneEvent(this.id, this.imageData);

  @override
  List<Object?> get props => [id];

}

class AddItemEvent extends CanvasEvent {
  final ResourceItem item;
  final Offset location;

  AddItemEvent(this.item, this.location);

  @override
  List<Object> get props => [item, location];
}

class RemoveItemEvent extends CanvasEvent {
  final Item item;

  RemoveItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class MoveItemUpEvent extends CanvasEvent {
  final CanvasItem selected;

  MoveItemUpEvent(this.selected);

  @override
  List<Object> get props => [selected];
}

class MoveItemDownEvent extends CanvasEvent {
  final CanvasItem selected;

  MoveItemDownEvent(this.selected);

  @override
  List<Object> get props => [selected];
}

class MoveItemToFrontEvent extends CanvasEvent {
  final CanvasItem selected;

  MoveItemToFrontEvent(this.selected);

  @override
  List<Object> get props => [selected];
}

class MoveItemToBackEvent extends CanvasEvent {
  final CanvasItem selected;

  MoveItemToBackEvent(this.selected);

  @override
  List<Object> get props => [selected];
}

class SelectItemEvent extends CanvasEvent {
  final CanvasItem selected;

  SelectItemEvent(this.selected);

  @override
  List<Object> get props => [selected];
}