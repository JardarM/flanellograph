import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/scene.dart';

class Scenes {

  final Map<String, Scene> scenes;

  Scenes(this.scenes);

  factory Scenes.empty(){
    return Scenes(<String, Scene>{});
  }

  factory Scenes.fromJson(jObj, Map<String, Background> backgrounds, Map<String, Item> items) {
    print("fromJson");
    final jMap = jObj['scenes'] as Map<String,dynamic>;
    print(jMap);
    return Scenes(jMap.map((key , value) => MapEntry(key, Scene.fromJson(key, value, backgrounds, items))));
  }

}