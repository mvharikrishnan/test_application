part of 'image_bloc.dart';

@immutable
class ImageState {
  String imagePath;
  ImageState({required this.imagePath});
}

class ImageInitial extends ImageState {
  ImageInitial() : super(imagePath: "asset/imageNotFound.png");
}
