import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/item.dart';

class Assets extends Equatable {
  final Map<String,Item> items;
  final Map<String,Background> backgrounds;

  const Assets({required this.items, required this.backgrounds});

  List<ResourceItem> get allItems {
    return [...backgrounds.values, ...items.values];
  }

  @override
  List<Object?> get props => [...items.values, ...backgrounds.values];

  @override
  bool? get stringify => true;

  factory Assets.empty(){
    return const Assets(items: <String,Item>{}, backgrounds: <String,Background>{});
  }

  static Assets fromJson(jsonObj) {
    final Map<String, dynamic> itemsMap = jsonObj["items"];
    final Map<String, dynamic> backgroundsMap = jsonObj["backgrounds"];
    return Assets(
        items: itemsMap.map((e, v) => MapEntry(e, Item.fromJsonItem(e, v as Map))),
        backgrounds: backgroundsMap.map((e, v) => MapEntry(e, Background.fromJson(e, v as Map)))
    );
  }
}