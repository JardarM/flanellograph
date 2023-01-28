import 'package:flanellograf/models/item.dart';

class Background extends ResourceItem {
  Background({required String id, required String image}):super(id, image);

  factory Background.fromJson(String id, Map json){
    return Background(id: id, image: 'backgrounds/'+json['image']);
  }



  @override
  bool isMatch(String searchToken) {
    return id.contains(searchToken);
  }
}