import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/resourceitem.dart';
import '../models/assets.dart';

abstract class AssetsState extends Equatable{
  const AssetsState();
}

class LoadingAssetsState extends AssetsState {
  @override
  List<Object?> get props => [];
}

class LoadedAssetsState extends AssetsState {
  final List<ResourceItem> assets;

  const LoadedAssetsState(this.assets);

  @override
  List<Object?> get props => [assets];
}