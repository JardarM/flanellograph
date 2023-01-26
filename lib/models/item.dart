import 'package:equatable/equatable.dart';

enum ItemType {
  Background,
  Foreground
}

class Item extends Equatable {
  String id;
  String image;
  String location;
  ItemType type = ItemType.Foreground;

  List<String> tags = List<String>.empty();

  Item({required this.id, required this.image, required this.location, required this.tags, this.type = ItemType.Foreground});

  factory Item.fromJsonItem(String id, Map json){
    return Item(id: id, image: 'items/'+json['image'], location: json['location'] as String, tags: (json["tags"] as List<dynamic>).map((e) => e as String).toList(), type: ItemType.Foreground);
  }

  factory Item.fromJsonBackground(String id, Map json){
    return Item(id: id, image: 'backgrounds/'+json['image'], location: "", tags: [], type: ItemType.Background);
  }

  @override
  List<Object?> get props => [id, image, location];

  @override
  bool? get stringify => true;

  bool isMatch(String searchToken){
    return id.contains(searchToken) || location.contains(searchToken) || tags.any((element) => element.contains(searchToken));
  }
}