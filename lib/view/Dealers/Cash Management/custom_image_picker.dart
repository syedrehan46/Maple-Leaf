import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// custom_image_picker.dart

class ImagePickerRow extends StatefulWidget {
  final bool isShowGallery;
  final Function(File) onImageSelected;

  const ImagePickerRow({
    Key? key,
    this.isShowGallery = true,
    required this.onImageSelected,
  }) : super(key: key);

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
      final File imageFile = File(pickedFile.path);
      setState(() {
        if (source == ImageSource.camera) {
          _cameraImage = imageFile;
          _galleryImage = null;
        } else {
          _galleryImage = imageFile;
          _cameraImage = null;
        }
      });
      widget.onImageSelected(imageFile); // Pass image back
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
          const SizedBox(height: 8.0),
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
            if (widget.isShowGallery)
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



