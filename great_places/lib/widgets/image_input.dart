
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageInput extends StatefulWidget {
  const ImageInput(this.onSelectImage, {super.key});
  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  // method to take a picture
  final ImagePicker _picker = ImagePicker();
  void _takePicture() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _storedImage = File(image.path);
      widget.onSelectImage(_storedImage!);
    });
    // final appDir = await getApplicationDocumentsDirectory();
    // final fileName = basename(image.path);
    // final savedImage = await image.saveTo('${appDir.path}/$fileName');
    //widget.onSelectImage (_storedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: _storedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(_storedImage!.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              : const Text(
                  'No Image Taken',
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
