import 'package:flanellograf/bloc/assets-events.dart';
import 'package:flanellograf/bloc/assets-states.dart';
import 'package:flanellograf/models/asset.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsBloc extends Bloc<AssetEvent, AssetsState> {

  Assets loaded = Assets(backgrounds: List<Background>.empty(), items: List<Item>.empty() );
  String? filter;

  AssetsBloc():super(LoadingAssetsState()) {
    on<LoadingAssetsEvent>(_loadAssets,);
    on<SearchAssetsEvent>(_filterAssets,);
    add(const LoadingAssetsEvent());
  }

  Future<void> _loadAssets(LoadingAssetsEvent event, Emitter<AssetsState> emit) async {
    loaded =  await Assets.loadAssets("assets/items.json");
    emit(LoadedAssetsState(_filter(loaded, filter)));
  }

  void _filterAssets(SearchAssetsEvent event, Emitter<AssetsState> emit) {
    filter = event.searchText;
    emit(LoadedAssetsState(_filter(loaded, filter)));
  }

  Assets _filter(Assets assets, String? filter){
    print(assets);
    if ( filter == null || filter.trim() == "") return loaded;
    final ret = Assets(
        items: assets.items.where((element) => element.id.contains(filter) || element.location.contains(filter) || element.tags.any((te) => te.contains(filter))).toList(),
        backgrounds: assets.backgrounds.where((element) => element.id.contains(filter),).toList()
    );
    print(ret);
    return ret;
  }
}