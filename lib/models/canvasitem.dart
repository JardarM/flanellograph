import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'item.dart';

class CanvasItem extends Equatable{

  CanvasItem({required this.item, this.offset = Offset.zero});

  Offset offset;
  Item item;

  static List<CanvasItem> loadForMenu(List<Item> items){
    return items.map((e) => CanvasItem(item: e, offset: Offset.zero)).toList();
  }

  @override
  List<Object?> get props => [offset, item];

  @override
  bool? get stringify => true;
}