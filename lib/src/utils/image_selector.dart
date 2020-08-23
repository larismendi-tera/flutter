import 'package:image_picker/image_picker.dart';

class ImageSelector {
  //final picker = ImagePicker();
  Future<PickedFile> selectImage(int type) async {
    type = type == null ? 0 : type;
    //return await picker.getImage(source: ImageSource.gallery);
    List<ImageSource> imageSourceList = [
      ImageSource.gallery,
      ImageSource.camera
    ];

    return await ImagePicker().getImage(source: imageSourceList[type]);
  }
}
