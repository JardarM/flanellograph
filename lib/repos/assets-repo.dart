import 'dart:convert';
import 'package:flanellograf/models/scene.dart';
import 'package:flutter/services.dart';
import '../models/assets.dart';
import '../models/scenes.dart';

class AssetsRepo {

  Scenes? scenes;
  Assets assets = Assets.empty();

  Future<Assets> loadAssets() async {
    final jsonString = await rootBundle.loadString("items.json");
    final jsonObj = json.decode(jsonString);
    final ret = Assets.fromJson(jsonObj);
    assets = ret;
    return ret;
  }

  Future<Scenes> loadScenes() async {
    final jsonString = await rootBundle.loadString("scenes.json");
    print(jsonString);
    final jsonObj = json.decode(jsonString);
    final ret = Scenes.fromJson(jsonObj, assets!.backgrounds, assets!.items);
    scenes = ret;
    return ret;
  }

  Future<void> saveScene(String name, Scene scene) async {
    throw Exception("Not implemented!");
  }

  Future<Scene> loadScene(String name) async {
    scenes ??= await loadScenes();
    return scenes!.scenes[name]!;
  }
}