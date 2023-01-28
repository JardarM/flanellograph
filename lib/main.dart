import 'package:flanellograf/bloc/assets-bloc.dart';
import 'package:flanellograf/bloc/canvas-bloc.dart';
import 'package:flanellograf/bloc/scene-bloc.dart';
import 'package:flanellograf/repos/assets-repo.dart';
import 'package:flanellograf/widgets/CanvasScene.dart';
import 'package:flanellograf/widgets/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

AssetsRepo repo = AssetsRepo();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: MultiBlocProvider(
            providers: [
                BlocProvider(create: (context) => CanvasBlock(repo)),
                BlocProvider(create: (context) => AssetsBloc(repo)),
                BlocProvider(create: (context) => SceneBloc(repo))
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
