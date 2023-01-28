import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';

class Scene extends Equatable {
  final String id;
  final String bible_ref;
  final String liturgical_year;
  final String liturgical_week;
  final List<String> tags;
  Background? background;
  Map<String, CanvasItem> items;

  Scene(this.id, this.bible_ref, this.liturgical_year, this.liturgical_week, this.tags, this.background, this.items);

  bool addItem(Item item, Offset offset){
    if ( items.containsKey(item.id)) return false;
    items.putIfAbsent(item.id, () => CanvasItem(item: item, offset: offset));
    return true;
  }

  bool removeItem(Item item){
    return items.remove(item.id) != null;
  }

  factory Scene.empty(){
    return Scene("", "", "", "", [], null, {});
  }

  factory Scene.fromJson(String id, Map jObj, Map<String, Background> backgrounds, Map<String, Item> items){
    print(id);
    print(jObj);
    final bg = backgrounds[(jObj['background'] as String)];
    final jMap = jObj['items'] as Map<String, dynamic>;
    print(jMap);
    final itms = jMap.map((key, value) => MapEntry(key,
        CanvasItem(item: items[key]!, offset: Offset(value['x'] as double, value['y'] as double))
    ));
    print(itms);
    return Scene(id,
        jObj['bible_ref'] as String, jObj['liturgical_year'] as String, jObj['liturgical_week'] as String,
        (jObj["tags"] as List<dynamic>).map((e) => e as String).toList(), bg, itms
    );
  }

  bool isMatch(String searchToken){
    return id.contains(searchToken) || bible_ref.contains(searchToken) || liturgical_year.contains(searchToken) || liturgical_week.contains(searchToken)
        || tags.any((element) => element.contains(searchToken))
        || items.values.any((element) => element.item.isMatch(searchToken));
  }

  @override
  List<Object?> get props => [id];
}
