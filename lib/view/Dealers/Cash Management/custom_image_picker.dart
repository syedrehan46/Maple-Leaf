import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRow extends StatefulWidget {
  @override
  _ImagePickerRowState createState() => _ImagePickerRowState();
}

class _ImagePickerRowState extends State<ImagePickerRow> {
  final ImagePicker _picker = ImagePicker();
  File? _cameraImage;
  File? _galleryImage;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (source == ImageSource.camera) {
          _cameraImage = File(pickedFile.path);
          _galleryImage = null; // Only one image at a time
        } else {
          _galleryImage = File(pickedFile.path);
          _cameraImage = null; // Only one image at a time
        }
      });
    }
  }

  Widget _buildImageOption({
    required File? imageFile,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          imageFile != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              imageFile,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          )
              : Icon(icon, size: 50.0),
          SizedBox(height: 8.0),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageOption(
              imageFile: _cameraImage,
              icon: Icons.camera_alt,
              label: 'Capture Image',
              onTap: () => _pickImage(ImageSource.camera),
            ),
            _buildImageOption(
              imageFile: _galleryImage,
              icon: Icons.photo,
              label: 'Select from Gallery',
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ],
    );
  }
}
