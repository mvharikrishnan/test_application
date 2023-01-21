// for taking photo

import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();
Future<String> capturePhoto() async {
  final getImage = await picker.pickImage(source: ImageSource.camera);
  if (getImage == null) {
    return "";
  } else {
    return getImage.path;
  }
}
