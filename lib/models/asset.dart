import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter/services.dart';

class Assets extends Equatable {
  List<Background> backgrounds = List<Background>.empty();
  List<Item> items = List<Item>.empty();

  Assets({required this.backgrounds, required this.items});

  static Future<Assets> loadAssets(String file) async {
    print("Loading assets from: $file");
    final jsonString = await rootBundle.loadString(file);
    final assets = json.decode(jsonString);
    final Map<String, dynamic> itemsMap = assets["items"];
    final Map<String, dynamic> backgroundsMap = assets["backgrounds"];
    return Assets(
        backgrounds: backgroundsMap.map((e, v) => MapEntry(e, Background.fromJson(e, v as Map))).values.toList(),
        items: itemsMap.map((e, v) => MapEntry(e, Item.fromJson(e, v as Map))).values.toList()
    );
  }

  @override
  List<Object?> get props => [...backgrounds, ...items];

  @override
  bool? get stringify => true;
}