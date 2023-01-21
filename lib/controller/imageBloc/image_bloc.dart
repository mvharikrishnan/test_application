import 'package:bloc/bloc.dart';
import 'package:machine_test/services/getImage.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<changeImage>((event, emit) async {
      String imagePath = await capturePhoto();
      emit(ImageState(imagePath: imagePath));
    });
  }
}
