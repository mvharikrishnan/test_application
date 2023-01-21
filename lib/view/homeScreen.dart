import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/controller/addressBloc/address_bloc.dart';
import 'package:machine_test/controller/imageBloc/image_bloc.dart';
import 'package:machine_test/services/getAddress.dart';
import 'package:machine_test/services/getImage.dart';

import 'package:machine_test/view/widgets/appBarWidget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  String? ImagePath;
  String? address1;
  String? address2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(10, 50),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ImageBloc, ImageState>(
                  builder: (context, state) {
                    return Container(
                      height: 0.7 * size.width,
                      width: 0.7 * size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (ImagePath != null)
                              ? FileImage(File(ImagePath!))
                              : AssetImage(state.imagePath) as ImageProvider,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            //address of the locality
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      state.currentAddress.locality ?? "Address 1",
                    ),
                    Text(
                      state.currentAddress.administrativeArea ?? "Address 2",
                    ),
                    Text(
                      state.currentAddress.country ?? "Address 3",
                    ),
                  ],
                );
              },
            ),

            GestureDetector(
              onTap: () async {
                debugPrint("--------Button pressed------");
                ImagePath = await capturePhoto();
                // getAddress.fetchAddress();
                BlocProvider.of<AddressBloc>(context).add(changeAddress());
                BlocProvider.of<ImageBloc>(context)
                    .add(changeImage(imagePath: ImagePath!));
              },
              child: Container(
                height: 0.1 * size.width,
                width: 0.3 * size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "CAPTURE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
