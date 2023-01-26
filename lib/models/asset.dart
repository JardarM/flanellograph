import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flanellograf/models/background.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter/services.dart';

class Assets extends Equatable {
//  List<Background> backgrounds = List<Background>.empty();
  List<Item> items = List<Item>.empty();

  Assets({required this.items});

  static Future<Assets> loadAssets(String file) async {
    print("Loading assets from: $file");
    final jsonString = await rootBundle.loadString(file);
    final assets = json.decode(jsonString);
    final Map<String, dynamic> itemsMap = assets["items"];
    final Map<String, dynamic> backgroundsMap = assets["backgrounds"];
    return Assets(
        items: [
          ...backgroundsMap.map((e, v) => MapEntry(e, Item.fromJsonBackground(e, v as Map))).values.toList(),
          ...itemsMap.map((e, v) => MapEntry(e, Item.fromJsonItem(e, v as Map))).values.toList()]
    );
  }

  @override
  List<Object?> get props => [...items];

  @override
  bool? get stringify => true;
}