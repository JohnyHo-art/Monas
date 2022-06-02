import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends ChangeNotifier {
  // pick image for transaction

  final ImagePicker _picker = ImagePicker();

  late List<XFile> _images = [];
  List<XFile> getImages() => _images;
  void setImages(newVal) {
    _images = newVal;
    notifyListeners();
  }

  Future pickImagesFromLib() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      getImages().addAll(selectedImages);
    }
    notifyListeners();
  }

  Future pickImageFromCam() async {
    XFile? selectedImage = await _picker.pickImage(source: ImageSource.camera);

    if (selectedImage != null) {
      getImages().add(selectedImage);
    }
    notifyListeners();
  }

  void removeImageFromList(int index) {
    getImages().remove(getImages()[index]);
    notifyListeners();
    _images[0].readAsBytes();
  }
}
