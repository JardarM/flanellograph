import 'package:flanellograf/bloc/canvas-bloc.dart';
import 'package:flanellograf/bloc/canvas-events.dart';
import 'package:flanellograf/bloc/canvas-states.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanvasScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasBlock, CanvasState>(builder: (context, state) {
      if (state is LoadingSceneState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is SceneUpdateState) {
        return DragTarget<ResourceItem>(
            builder: (context, candidateData, rejectedData) => Container(
                  decoration: BoxDecoration(
                      image: state.scene.background == null
                          ? null
                          : DecorationImage(image: AssetImage(state.scene.background?.image ?? ""), fit: BoxFit.fitWidth)),
                  child: Stack(
                    children: state.scene.items.values.map((e) => DragableImage(e)).toList(),
                  ),
                ),
            onAccept: (data) {
              BlocProvider.of<CanvasBlock>(context).add(AddItemEvent(data, Offset(50, 100)));
            });
      } else {
        throw Exception("Unexpected state: ${state}");
      }
    });
  }
}

class DragableImage extends StatefulWidget {
  CanvasItem item;

  DragableImage(this.item);

  @override
  _DragableImageState createState() => _DragableImageState(item);
}

class _DragableImageState extends State<DragableImage> {
  CanvasItem item;

  _DragableImageState(this.item);

  @override
  Widget build(BuildContext context) {
    final GlobalKey imgKey = GlobalKey();

    return Positioned(
        left: item.offset.dx ?? 0,
        top: item.offset.dy ?? 0,
        child: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerDown: (details) {
            setState(() {});
          },
          onPointerMove: (details) {
            setState(() {
              item.offset += details.delta;
            });
          },
          child: Image.asset(item.item.image, key: imgKey, scale: 3, alignment: Alignment.topLeft),
        ));
  }
}
