import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OnlyCameraIconPicker extends StatefulWidget {
  const OnlyCameraIconPicker({Key? key}) : super(key: key);

  @override
  State<OnlyCameraIconPicker> createState() => _OnlyCameraIconPickerState();
}

class _OnlyCameraIconPickerState extends State<OnlyCameraIconPicker> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker =
    ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera); // can use gallery if needed

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: _imageFile == null
              ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
              : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              _imageFile!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
