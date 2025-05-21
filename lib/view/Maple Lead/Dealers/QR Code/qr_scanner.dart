import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      setState(() => _hasPermission = false);
      return;
    }

    setState(() => _hasPermission = true);
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No camera available')),
      );
      return;
    }

    final camera = cameras.first;
    _controller = CameraController(camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasPermission) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Camera permission not granted',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    if (_controller == null || _initializeControllerFuture == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller!),
                const ScannerOverlay(),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            child: CustomPaint(
              foregroundPainter: ScannerPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class ScannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cornerLength = 36.0; // doubled from 15 to 30 pixels
    final strokeWidth = 4.0;

    final cornerPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final centerLinePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    // Top Left Corner
    canvas.drawLine(Offset(0, 0), Offset(cornerLength, 0), cornerPaint); // top horizontal
    canvas.drawLine(Offset(0, 0), Offset(0, cornerLength), cornerPaint); // left vertical

    // Top Right Corner
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), cornerPaint); // top horizontal
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), cornerPaint); // right vertical

    // Bottom Left Corner
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), cornerPaint); // left vertical
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), cornerPaint); // bottom horizontal

    // Bottom Right Corner
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), cornerPaint); // bottom horizontal
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), cornerPaint); // right vertical

    // Center red scanning line
    final centerY = size.height / 2;
    canvas.drawLine(Offset(0, centerY), Offset(size.width, centerY), centerLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
