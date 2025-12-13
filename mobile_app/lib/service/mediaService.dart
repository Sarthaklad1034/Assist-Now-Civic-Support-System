import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class mediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return null;
    final x = await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    return x != null ? File(x.path) : null;
  }

  Future<File?> pickFromGallery() async {
    final status = await Permission.photos.request(); // iOS specific
    // On Android 13+, READ_MEDIA_IMAGES not required by image_picker.
    final x = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    return x != null ? File(x.path) : null;
  }
}
