import 'package:flanellograf/bloc/canvas-states.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flanellograf/bloc/canvas-events.dart';
import 'dart:ui';

class CanvasBlock extends Bloc<CanvasEvent, CanvasState>{

  CanvasBlock():super(LoadingSceneState()){
    on<AddItemEvent>(_addItem);
    emit(SceneUpdateState(List<CanvasItem>.empty(), null, null));
  }

  void _addItem(AddItemEvent event, Emitter<CanvasState> emit) {
    if ( event.item.type == ItemType.Foreground ){
      final s = ( state as SceneUpdateState );
      emit(SceneUpdateState([...(s.items), CanvasItem(item: event.item, offset: event.location)], s.selectedItem, s.background));
    } else {
      final s = ( state as SceneUpdateState );
      emit(SceneUpdateState(s.items, s.selectedItem, event.item));

    }
  }

}