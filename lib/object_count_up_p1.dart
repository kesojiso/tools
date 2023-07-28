import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

class CameraLoad extends StatelessWidget {
  Future<CameraController> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    final controller = CameraController(firstCamera, ResolutionPreset.medium);
    await controller.initialize();
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CameraController>(
      future: initCamera(),
      builder:
          (BuildContext context, AsyncSnapshot<CameraController> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ObjectCountUp(
              controller: snapshot
                  .data!); // pass the initialized controller to ObjectCountUp
        }
      },
    );
  }
}

class ObjectCountUp extends StatefulWidget {
  final CameraController controller;

  const ObjectCountUp(
      {required this.controller}); // receive the controller as a constructor argument

  @override
  _ObjectCountUpState createState() => _ObjectCountUpState();
}

class _ObjectCountUpState extends State<ObjectCountUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose(); // dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!widget.controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Object Count Up")),
        body: ListView(
          children: <Widget>[
            SizedBox(
                width: size.width,
                //height: size.height / 4,
                child: Transform.scale(
                    scale: 1.0,
                    child: AspectRatio(
                      aspectRatio: widget.controller.value.aspectRatio,
                      child: CameraPreview(
                          widget.controller), // use the passed controller
                    ))),
            const Text("Take picture objects you want to count up",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ));
  }
}
