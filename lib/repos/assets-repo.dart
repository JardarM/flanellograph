import 'dart:convert';
import 'package:flanellograf/models/scene.dart';
import 'package:flutter/services.dart';
import 'package:localstore/localstore.dart';
import '../models/assets.dart';
import '../models/scenes.dart';

class AssetsRepo {

  static const String ItemsResourceName = "items.json";
  static const String ScenesResourceName = "scenes.json";
  static const String ScenesLocalStoreCollectinoName = "scenes";

  Scenes? scenes;
  Assets? assets;

  Future<Assets> getAssets() async{
    if ( assets != null ) assets;
    return await _loadAssets();
  }

  Future<Scenes> getScenes() async{
    if ( scenes != null ) scenes;
    var sScenes = await _loadSystemScenes();
    var uScenes = await _loadUserScenes();
    var s = Scenes.empty();
    s.scenes.addAll(sScenes.scenes);
    s.scenes.addAll(uScenes.scenes);
    scenes = s;
    return s;
  }

  Future<Assets> _loadAssets() async {
    final jsonString = await rootBundle.loadString(ItemsResourceName);
    final jsonObj = json.decode(jsonString);
    return Assets.fromJson(jsonObj);
  }

  Future<Scenes> _loadSystemScenes() async {
    print("_loadSystemScenes");
    final jsonString = await rootBundle.loadString(ScenesResourceName);
    final jsonObj = json.decode(jsonString);
    final a = await getAssets();
    final jMap = jsonObj['scenes'] as Map<String,dynamic>;
    return Scenes.fromJson(jMap, true, a.backgrounds, a.items);
  }

  Future<Scenes> _loadUserScenes() async {
    print("_loadUserScenes");
    final a = await getAssets();
    final _db = Localstore.instance;
    final jsonObj = (await _db.collection(ScenesLocalStoreCollectinoName).get() ?? {});
    return Scenes.fromJson(jsonObj, true, a.backgrounds, a.items);
  }

  Future<void> saveScene(String name, Scene scene) async {
    print("saveScene $name");
    final _db = Localstore.instance;
    _db.collection(ScenesLocalStoreCollectinoName).doc(name).set(scene.toMap());
  }

  Future<Scene> loadScene(String name) async {
    final s = await getScenes();
    return s.scenes[name]!;
  }
}