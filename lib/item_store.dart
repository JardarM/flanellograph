// import 'dart:convert';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'models/background.dart';
// import 'models/item.dart';
//
//
// class BackgroundsCubit extends Cubit<List<Background>>{
//   BackgroundsCubit(super.initialState){
//     load();
//   }
//
//   void load() async{
//     emit((await Assets.loadAssets("assets/items.json")).backgrounds);
//   }
// }
//
//
// class ItemStore extends Cubit<List<Item>>{
//   List<Item> allItems = List<Item>.empty();
//   ItemStore(super.initialState){
//     load();
//   }
//
//   void load() async {
//     print("Loading");
//     allItems = (await Assets.loadAssets("assets/items.json")).items;
//     emit(allItems);
//   }
//
//   void search(String ss){
//     emit(allItems.where((element) =>
//         element.id.startsWith(ss) ||
//         element.tags.any((t) => t.startsWith(ss))).toList());
//   }
//
// }
//
// class CanvasItemStore extends Cubit<List<CanvasItem>>{
//
//   CanvasItemStore(super.initialState);
//
//   CanvasItem add(Item item, Offset position){
//     //Can only be added once to the canvas
//     return state.singleWhere((element) => element.item.id == item.id, orElse: () {
//       var li = CanvasItem(item: item, isOnCanvas: true, offset: position);
//       emit([...state, li]);
//       return li;
//     },);
//
//   }
//
//   void remove(Item item){
//     emit(state.where((element) => element.item.id != item.id).toList());
//   }
// }
