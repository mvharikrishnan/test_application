part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class changeImage extends ImageEvent {
  changeImage({required String imagePath});
}
