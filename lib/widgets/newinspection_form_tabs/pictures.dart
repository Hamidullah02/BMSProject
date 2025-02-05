import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PicturesTab extends StatefulWidget {
  const PicturesTab({Key? key}) : super(key: key);

  @override
  _PicturesTabState createState() => _PicturesTabState();
}

class _PicturesTabState extends State<PicturesTab> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, File?> _images = {};

  Future<void> _pickImage(String title) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[title] = File(pickedFile.path);
      });
    }
  }

  Future<void> _addNewPicture() async {
    final String newTitle = 'New Image ${_images.length + 1}';
    await _pickImage(newTitle);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Bridge Pictures'),
          const SizedBox(height: 16),
          _buildImageUploadSection('Side View L'),
          _buildImageUploadSection('Side View R'),
          _buildImageUploadSection('LC'),
          _buildImageUploadSection('HC'),
          _buildImageUploadSection('Span'),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _addNewPicture,
            icon: const Icon(Icons.add_photo_alternate),
            label: const Text('Add New Picture'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(title),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              image: _images[title] != null
                  ? DecorationImage(
                image: FileImage(_images[title]!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: _images[title] == null
                ? const Center(child: Icon(Icons.add_a_photo))
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text('Feature Photo'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text('Public Access'),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
