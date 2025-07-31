import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPreview extends StatelessWidget {
  final io.File? imageFile;
  final XFile? webImage;

  const ImagePickerPreview({
    super.key,
    required this.imageFile,
    required this.webImage,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (webImage != null) {
        return FutureBuilder<List<int>>(
          future: webImage!.readAsBytes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final bytes = snapshot.data;
              if (bytes != null) {
                return Image.memory(Uint8List.fromList(bytes), fit: BoxFit.cover);
              } else {
                return const Center(child: Text('No image data'));
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      } else {
        return const Center(child: Icon(Icons.image, size: 60, color: Colors.grey));
      }
    } else {
      if (imageFile != null) {
        return Image.file(imageFile!, fit: BoxFit.cover);
      } else {
        return const Center(child: Icon(Icons.image, size: 60, color: Colors.grey));
      }
    }
  }
}