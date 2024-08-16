import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageItem {
  final int id;
  final XFile file;

  ImageItem({required this.id, required this.file});
}

class MultiImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imageFileList = <ImageItem>[].obs;
  var _idCounter = 0.obs;

  Future<void> pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      for (var image in selectedImages) {
        imageFileList.add(ImageItem(id: _idCounter.value++, file: image));
      }
    }
  }

  void removeImage(int id) {
    imageFileList.removeWhere((item) => item.id == id);
  }

  void clearImages() {
    imageFileList.clear();
    _idCounter.value = 0;
  }
}
