import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ResourceItem extends Equatable {
  final String id;
//  final Image? _img;

  const ResourceItem(this.id);

  bool isMatch(String searchToken);

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;

//  Image get image => _img ?? _image;
  Image get image;

}

