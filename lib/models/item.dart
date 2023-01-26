import 'package:equatable/equatable.dart';

class Item extends Equatable {
  String id;
  String image;
  String location;
  List<String> tags = List<String>.empty();

  Item({required this.id, required this.image, required this.location, required this.tags});

  factory Item.fromJson(String id, Map json){
    return Item(id: id, image: 'items/'+json['image'], location: json['location'] as String, tags: (json["tags"] as List<dynamic>).map((e) => e as String).toList());
  }

  @override
  List<Object?> get props => [id, image, location];

  @override
  bool? get stringify => true;
}