import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/asset.dart';

abstract class AssetEvent extends Equatable {
  const AssetEvent();
}

class LoadingAssetsEvent extends AssetEvent{
    const LoadingAssetsEvent();

  @override
  List<Object?> get props => [];
}

class SearchAssetsEvent extends AssetEvent {
  final String searchText;

  SearchAssetsEvent(this.searchText);

  @override
  List<Object?> get props => [searchText];
}