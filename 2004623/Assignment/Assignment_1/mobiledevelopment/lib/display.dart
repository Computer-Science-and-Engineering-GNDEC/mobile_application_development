import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  TextEditingController _nameController = TextEditingController();

  Future<void> _getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> _getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  void _navigateToDetailsScreen() async {
    // Pass data to the details screen
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          name: _nameController.text,
          image: _image,
        ),
      ),
    );

    // Check the result from the details screen
    if (result == true) {
      // Clear data if result is true
      setState(() {
        _image = null;
        _nameController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: _image != null
                      ? FileImage(File(_image!.path)) as ImageProvider
                      : NetworkImage(
                    "https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png",
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      // Show options when the add_a_photo icon is clicked
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text('Camera'),
                                onTap: () {
                                  _getImageFromCamera();
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo),
                                title: Text('Gallery'),
                                onTap: () {
                                  _getImageFromGallery();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add_a_photo_outlined),
                  ),
                  bottom: -10,
                  left: 80,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToDetailsScreen,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String name;
  final File? image;

  DetailsScreen({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: image != null
                  ? FileImage(image!) as ImageProvider
                  : NetworkImage(
                "https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png",
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pop the details screen and pass true as result
                Navigator.pop(context, true);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
