import 'package:flanellograf/bloc/assets-bloc.dart';
import 'package:flanellograf/bloc/assets-events.dart';
import 'package:flanellograf/bloc/assets-states.dart';
import 'package:flanellograf/bloc/canvas-bloc.dart';
import 'package:flanellograf/bloc/canvas-events.dart';
import 'package:flanellograf/bloc/scene-bloc.dart';
import 'package:flanellograf/bloc/scene-events.dart';
import 'package:flanellograf/bloc/scene-states.dart';
import 'package:flanellograf/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.ac_unit_rounded)),
                ],
              ),
              title: Text("Flanellograph"),
            ),
            body: TabBarView(
              children: [
                ResourceMenu(),
                SceneMenu(),
              ],
            ),
          )
      ),
    );
  }
}

class ResourceMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Search..."),
          onChanged: (value) => BlocProvider.of<AssetsBloc>(context).add(SearchAssetsEvent(value)),
        ),
        BlocBuilder<AssetsBloc, AssetsState>(builder: (context, state) {
          print("Asset state: $state");
          if (state is LoadingAssetsState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedAssetsState) {
            return Expanded(
              child: ListView(
                children: state.assets.map((e) => MenuItem(e)).toList(),
              ),
            );
          } else {
            throw Exception("Unexpected state: $state");
          }
        }),
      ],
    );
  }
}

class SceneMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Search..."),
            onChanged: (value) => BlocProvider.of<SceneBloc>(context).add(SearchScenesEvent(value)),
          ),
          OutlinedButton(onPressed: () => BlocProvider.of<CanvasBlock>(context).add(SaveSceneEvent("jardar")), child: Text("Save")),
          SceneList(),
        ]
      );
  }
}



class SceneList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SceneBloc, SceneState>(
      builder: (context, state) {
        if (state is SceneUpdateState) {
          return Column(
              children: state.scenes
                  .map(
                    (e) => OutlinedButton(
                        onPressed: () => BlocProvider.of<CanvasBlock>(context).add(LoadSceneEvent(id: e.id)),
                        child: Text(e.id)),
                  )
                  .toList());
        }
        throw Exception("Unexpected state: $state");
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  ResourceItem item;

  MenuItem(this.item);

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<ResourceItem>(
        data: item,
        feedback: Image.asset(item.image, height: 100),
        child: Column(children: [Text(item.id), Image.asset(item.image, height: 100)]));
  }
}
