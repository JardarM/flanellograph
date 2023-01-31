import 'package:flanellograf/bloc/canvas-bloc.dart';
import 'package:flanellograf/bloc/canvas-events.dart';
import 'package:flanellograf/bloc/canvas-states.dart';
import 'package:flanellograf/models/canvasitem.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flanellograf/models/resourceitem.dart';
import 'package:flanellograf/models/scene.dart';
import 'package:flanellograf/widgets/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CanvasScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasBlock, CanvasState>(builder: (context, state) {
      if (state is LoadingSceneState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SceneUpdateState) {
        return DragTarget<ResourceItem>(
            builder: (context, candidateData, rejectedData) =>
                RepaintBoundary(child: CanvasSceneView(scene: state.scene), key: canvasKey,),
            onAccept: (data) {
              BlocProvider.of<CanvasBlock>(context).add(AddItemEvent(data, const Offset(50, 100)));
            });
      } else {
        throw Exception("Unexpected state: $state");
      }
    });
  }
}

class CanvasSceneView extends StatelessWidget {
  final Scene scene;

  const CanvasSceneView({super.key, required this.scene});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: scene.background == null
              ? null
              : DecorationImage(image: scene.backgroundImage.image, fit: BoxFit.fitWidth)),
      child: Stack(
        children: scene.items.values
            .map((e) => DragableImage(
                  e,
                  key: UniqueKey(),
                ))
            .toList(),
      ),
    );
  }
}

class DragableImage extends StatefulWidget {
  CanvasItem item;

  DragableImage(this.item, {super.key});

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
          child: Transform.scale(scale: 0.25, child: item.item.image),
        ));
  }
}
