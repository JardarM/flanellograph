import 'dart:convert';
import 'package:flanellograf/models/scene.dart';
import 'package:flutter/services.dart';
import 'package:localstore/localstore.dart';
import '../models/assets.dart';
import '../models/scenes.dart';

class AssetsRepo {

  Scenes? scenes;
  Assets? assets;

  Future<Assets> getAssets() async{
    if ( assets != null ) assets;
    return await _loadAssets();
  }

  Future<Scenes> getScenes() async{
    if ( scenes != null ) scenes;
    return await _loadScenes();
  }

  Future<Assets> _loadAssets() async {
    final jsonString = await rootBundle.loadString("items.json");
    final jsonObj = json.decode(jsonString);
    return Assets.fromJson(jsonObj);
  }

  Future<Scenes> _loadScenes() async {
    final jsonString = await rootBundle.loadString("scenes.json");
    final jsonObj = json.decode(jsonString);
    final a = await getAssets();
    return Scenes.fromJson(jsonObj, a.backgrounds, a.items);
  }

  Future<void> saveScene(String name, Scene scene) async {
    final _db = Localstore.instance;
    _db.collection("scenes").doc("name").set(scene.toMap());
  }

  Future<Scene> loadScene(String name) async {
    final s = await getScenes();
    return s.scenes[name]!;
  }
}