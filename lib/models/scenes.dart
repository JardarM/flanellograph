import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/scene.dart';

class Scenes {

  final Map<String, Scene> scenes;

  Scenes(this.scenes);

  factory Scenes.empty(){
    return Scenes(<String, Scene>{});
  }

  factory Scenes.fromJson(Map<String,dynamic> jObj, bool isSystemType, Map<String, Background> backgrounds, Map<String, Item> items) {
    return Scenes(jObj.map((key , value) => MapEntry(key, Scene.fromJson(key, isSystemType, value, backgrounds, items))));
  }

}