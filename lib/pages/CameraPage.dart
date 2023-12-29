import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class Camerapage extends StatefulWidget {
  const Camerapage({super.key});

  @override
  State<Camerapage> createState() => _CamerapageState();
}

class _CamerapageState extends State<Camerapage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  Widget? cameraPreview;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    camera = cameras!.last;
    _controller = CameraController(camera!, ResolutionPreset.high);
    await _controller!.initialize();
    cameraPreview = Center(child: CameraPreview(_controller!));
    setState(() {
      cameraPreview = cameraPreview;
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    print('Dispose เค็มๆ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Camera'), actions: [
      IconButton(
          icon: Icon(Icons.camera_alt_outlined),
          onPressed: () async {
            final image = await _controller!.takePicture();
            print(image.path);
            Navigator.pushNamed(context, 'homestack/picture',
                arguments: {'path': image.path});
          })
    ]));
  }
}
