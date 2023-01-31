import 'package:flanellograf/models/resourceitem.dart';
import 'package:flutter/material.dart';

class Background extends ResourceItem {
  final String imageResource;

  const Background({required String id, required this.imageResource}):super(id);

  factory Background.fromJson(String id, Map json){
    return Background(id: id, imageResource: 'backgrounds/'+json['image']);
  }

  @override
  bool isMatch(String searchToken) {
    return id.contains(searchToken);
  }

  @override
  Image get image => imageResource == null ? Image.asset("empty.png") : Image.asset(this.imageResource);

}