import 'package:flanellograf/bloc/assets-events.dart';
import 'package:flanellograf/bloc/assets-states.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/repos/assets-repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsBloc extends Bloc<AssetEvent, AssetsState> {

  List<ResourceItem> loaded = List<ResourceItem>.empty();
  String? filter;
  final AssetsRepo repo;

  AssetsBloc(this.repo):super(LoadingAssetsState()) {
    on<LoadingAssetsEvent>(_loadAssets,);
    on<SearchAssetsEvent>(_filterAssets,);
    add(const LoadingAssetsEvent());
  }

  Future<void> _loadAssets(LoadingAssetsEvent event, Emitter<AssetsState> emit) async {
    loaded =  (await repo.getAssets()).allItems;
    emit(LoadedAssetsState(_filter(loaded, filter)));
  }

  void _filterAssets(SearchAssetsEvent event, Emitter<AssetsState> emit) {
    filter = event.searchText;
    emit(LoadedAssetsState(_filter(loaded, filter)));
  }

  List<ResourceItem> _filter(List<ResourceItem> assets, String? filter){
    if ( filter == null || filter.trim() == "") return loaded;
    return assets.where((element) => element.isMatch(filter)).toList();
  }
}