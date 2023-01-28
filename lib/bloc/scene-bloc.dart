

import 'package:flanellograf/bloc/scene-events.dart';
import 'package:flanellograf/bloc/scene-states.dart';
import 'package:flanellograf/repos/assets-repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SceneBloc extends Bloc<SceneEvent, SceneState>{
  final AssetsRepo repo;

  SceneBloc(this.repo):super(SceneUpdateState.empty()){
    on<LoadingScenesEvent>(_loadScenes);
    add(LoadingScenesEvent());
  }

  _loadScenes(LoadingScenesEvent event, Emitter<SceneState> emit) async {
    emit(SceneUpdateState(await repo.getScenes()));
  }
}