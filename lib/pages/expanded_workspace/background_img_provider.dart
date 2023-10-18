import 'package:flutter/material.dart';

class BackgroundImageProvider extends ChangeNotifier {
  ImageProvider? _image;

  set image(ImageProvider? image) {
    _image = image;
    notifyListeners();
  }

  ImageProvider? get image {
    return _image;
  }
}
