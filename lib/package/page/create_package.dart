import 'dart:io' as io;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travel_agency/package/widget/image_picker_preview_widget.dart';
import 'package:travel_agency/package/widget/text_input_field_widget.dart';

import '../../db/database_helper.dart';

class CreatePackagePage extends StatefulWidget {
  final String email;

  const CreatePackagePage({super.key, required this.email});

  @override
  _CreatePackagePageState createState() => _CreatePackagePageState();
}

class _CreatePackagePageState extends State<CreatePackagePage> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';
  String destination = '';
  String price = '';
  String country = '';
  String city = '';
  String type = '';
  io.File? imageFile;
  XFile? webImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (picked == null) return;

    if (kIsWeb) {
      setState(() => webImage = picked);
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(picked.path);
      final savedImage = await io.File(picked.path).copy('${appDir.path}/$fileName');
      setState(() => imageFile = savedImage);
    }
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    String imagePath = '';
    if (!kIsWeb && imageFile != null) {
      imagePath = imageFile!.path;
    } else if (kIsWeb && webImage != null) {
      imagePath = webImage!.name;
    }

    await DatabaseHelper.instance.insertPackage({
      'title': title,
      'description': description,
      'destination': destination,
      'price': price,
      'country': country,
      'city': city,
      'type': type,
      'image': imagePath,
      'email': widget.email
    });

    if (!mounted) return;

    _showSnackBar(context, 'Package Created Successfully!');

    _formKey.currentState!.reset();
    setState(() {
      imageFile = null;
      webImage = null;
    });

    Navigator.of(context).pop(true);
  }

  void _showSnackBar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Travel Package")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextInputField(label: 'Package Title', onSave: (v) => title = v!, isRequired: true),
              TextInputField(label: 'Destination', onSave: (v) => destination = v!, isRequired: true),
              TextInputField(label: 'Country', onSave: (v) => country = v!),
              TextInputField(label: 'City', onSave: (v) => city = v!),
              TextInputField(label: 'Type (e.g. tour, hike)', onSave: (v) => type = v!),
              TextInputField(
                label: 'Price',
                onSave: (v) => price = v!,
                isRequired: true,
                keyboardType: TextInputType.number,
              ),
              TextInputField(
                label: 'Description',
                onSave: (v) => description = v!,
                isRequired: true,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              const Text("Package Image", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey[100],
                  ),
                  child: ImagePickerPreview(imageFile: imageFile, webImage: webImage),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitForm(context),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
