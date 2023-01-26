import 'package:flanellograf/bloc/assets-bloc.dart';
import 'package:flanellograf/bloc/canvas-bloc.dart';
import 'package:flanellograf/widgets/CanvasScene.dart';
import 'package:flanellograf/widgets/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: MultiBlocProvider(
            providers: [
                BlocProvider(create: (context) => CanvasBlock()),
                BlocProvider(create: (context) => AssetsBloc())
            ],
            child: MainLayout())
      ),
    );
  }
}


class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainMenu(),
          Divider(thickness: 5),
          Expanded(child: CanvasScene())
        ],
      ),
    );
  }
}

// class MainMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(width: 300, color: Colors.black12,
//       child:
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           BlocBuilder<BackgroundsCubit, List<Background>>(
//             builder: (context, state) => state.length == 0 ? Text("") : DropdownButton(
//               value: state.first,
//               onChanged: (value) => print(value),
//               items: state.map((e) => DropdownMenuItem(value: e,child: Text(e.id),)).toList(),
//             ),),
//           TextField(decoration: InputDecoration(hintText: "Search..."), onChanged: (value) => BlocProvider.of<ItemStore>(context).search(value),),
//           BlocBuilder<ItemStore, List<Item>>(
//           builder: (context, state) =>
//               Expanded(
//                 child: ListView(
//                   children: state.map((e) => MenuItem(e)).toList(),
//                 ),
//               ),
//         )],
//       )
//       ,);
//   }
// }
//
// class MenuItem extends StatelessWidget {
//
//   Item item;
//
//   MenuItem(this.item);
//
//   @override
//   Widget build(BuildContext context) {
//     return LongPressDraggable<Item>(
//         data: this.item,
//         feedback: Image.asset(item.image, height: 100),
//         child: Column(
//             children: [
//               Text(item.id),
//               Image.asset(item.image, height: 100)
//     ]));
//   }
// }
//
//
// class CanvasScene extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement createState
//     return BlocBuilder<CanvasItemStore, List<CanvasItem>>(
//             builder: (context, state) =>
//               DragTarget<Item>(
//                 builder: (context, candidateData, rejectedData) => Stack(
//                   children: state.map((e) => DragableImage(e)).toList(),
//                 ),
//                 onAccept: (data) {
//                   var t = context.read<CanvasItemStore>();
//                   t.add(data, Offset(50,100));
//                 }
//               ),
//             );
//   }
// }
//
// class DragableImage extends StatefulWidget {
//   CanvasItem item;
//
//   DragableImage(this.item);
//
//   @override
//   _DragableImageState createState() => _DragableImageState(item);
// }
//
//
// class _DragableImageState extends State<DragableImage> {
//
//   CanvasItem item;
//
//   _DragableImageState(this.item);
//
//   @override
//   Widget build(BuildContext context) {
//
//     final GlobalKey imgKey = GlobalKey();
//
//     return Positioned(
//         left: item.offset.dx ?? 0,
//         top: item.offset.dy ?? 0,
//         child: GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onPanDown: (details) {
//             setState(() {
//             });
//           },
//           onPanUpdate: (details) {
//             setState(() {
//               item.offset += details.delta;
//             });
//           },
//           child: Image.asset(item.item.image, key: imgKey, scale: 3, alignment: Alignment.topLeft)
//           ,
//         ));
//   }
// }