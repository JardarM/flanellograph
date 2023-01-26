import 'package:equatable/equatable.dart';
import '../models/asset.dart';

abstract class AssetsState extends Equatable{
  const AssetsState();
}

class LoadingAssetsState extends AssetsState {
  @override
  List<Object?> get props => [];
}

class LoadedAssetsState extends AssetsState {
  final Assets assets;

  const LoadedAssetsState(this.assets);

  @override
  List<Object?> get props => [assets];
}