import 'package:flanellograf/bloc/canvas-states.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/repos/assets-repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flanellograf/bloc/canvas-events.dart';
import 'dart:ui';
import 'package:flanellograf/models/scene.dart';

class CanvasBlock extends Bloc<CanvasEvent, CanvasState>{

  final AssetsRepo repo;
  final Scene scene = Scene.empty();

  CanvasBlock(this.repo):super(LoadingSceneState()){
    on<AddItemEvent>(_addItem);
    emit(SceneUpdateState(scene, null));
  }

  void _loadScene(AddItemEvent event, Emitter<CanvasState> emit) async{
  }

  void _addItem(AddItemEvent event, Emitter<CanvasState> emit) {
    if ( event.item is Background ){
      print("add background");
      scene.background = event.item as Background;
      emit(SceneUpdateState(scene, null));
    } else if ( event.item is Item ){
      print("add item");
      final s = ( state as SceneUpdateState );
      scene.addItem(event.item as Item, event.location);
      emit(SceneUpdateState(scene, null));
    }
  }

}