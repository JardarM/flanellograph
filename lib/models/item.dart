import 'package:equatable/equatable.dart';

abstract class ResourceItem extends Equatable{
  final String id;
  final String image;

  const ResourceItem(this.id, this.image);

  bool isMatch(String searchToken);

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;
}

class Item extends ResourceItem {
  final String location;
  final List<String> tags;

  const Item({required String id, required String image, required this.location, required this.tags}):super(id, image);

  factory Item.fromJsonItem(String id, Map json){
    return Item(id: id, image: 'items/'+json['image'], location: json['location'] as String, tags: (json["tags"] as List<dynamic>).map((e) => e as String).toList());
  }

  @override
  bool isMatch(String searchToken){
    return id.contains(searchToken) || location.contains(searchToken) || tags.any((element) => element.contains(searchToken));
  }
}