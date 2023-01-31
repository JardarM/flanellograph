import 'package:flanellograf/models/resourceitem.dart';
import 'package:flutter/material.dart';

class Item extends ResourceItem {
  final String location;
  final String imageResource;
  final List<String> tags;

  Item({required String id, required this.imageResource, required this.location, required this.tags}):super(id);

  factory Item.fromJsonItem(String id, Map json){
    return Item(id: id, imageResource: 'items/'+json['image'], location: json['location'] as String, tags: (json["tags"] as List<dynamic>).map((e) => e as String).toList());
  }

  @override
  bool isMatch(String searchToken){
    return id.contains(searchToken) || location.contains(searchToken) || tags.any((element) => element.contains(searchToken));
  }

  @override
  Image get image => imageResource == null ? Image.asset("empty.png") : Image.asset(this.imageResource);
}