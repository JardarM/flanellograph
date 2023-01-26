import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../models/canvasitem.dart';
import '../models/item.dart';

abstract class CanvasEvent extends Equatable {
  const CanvasEvent();
}

class AddItemEvent extends CanvasEvent {
  final Item item;
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