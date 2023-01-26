import 'package:equatable/equatable.dart';

class Background extends Equatable {
  String id;
  String image;
  Background({required this.id, required this.image});

  factory Background.fromJson(String id, Map json){
    return Background(id: id, image: 'background/'+json['image']);
  }

  @override
  List<Object?> get props => [id, image];

  @override
  bool? get stringify => true;
}