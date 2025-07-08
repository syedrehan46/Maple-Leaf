import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapleleaf/utils/app_colors.dart';

// Define your light orange color (replace with your AppColors if needed)
const Color lightOrange = Color(0xFFFFA726); // Example light orange

class ImagePickerRow extends StatefulWidget {
  final bool isShowGallery;
  final Function(File) onImageSelected;
  final int height;
  final int width;
  final String? label; // Optional label

  const ImagePickerRow({
    Key? key,
    this.isShowGallery = true,
    this.height = 50,
    this.width = 50,
    this.label,
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
    String? label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          imageFile != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                lightOrange,
                BlendMode.modulate,
              ),
              child: Image.file(
                imageFile,
                width: widget.width.toDouble(),
                height: widget.height.toDouble(),
                fit: BoxFit.cover,
              ),
            ),
          )
              : Icon(
            icon,
            size: widget.width.toDouble(),
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 8.0),
          if (label != null && label.isNotEmpty)
            Text(label!, textAlign: TextAlign.center),
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
              label: widget.label,
              onTap: () => _pickImage(ImageSource.camera),
            ),
            if (widget.isShowGallery)
              _buildImageOption(
                imageFile: _galleryImage,
                icon: Icons.photo,
                label: widget.label,
                onTap: () => _pickImage(ImageSource.gallery),
              ),
          ],
        ),
      ],
    );
  }
}
