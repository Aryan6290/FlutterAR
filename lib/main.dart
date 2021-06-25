import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Augmented Reality Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ArCoreController arCoreController;
  _onArCoreViewCreated(ArCoreController _arCoreController) {
    arCoreController = _arCoreController;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController _arCoreController) {
    final material = ArCoreMaterial(color: Colors.deepOrange);
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1),
    );
    _arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated));
  }
}
