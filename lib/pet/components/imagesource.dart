import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({this.imageSelected});
  final Function(File) imageSelected;
  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return BottomSheet(
      onClosing: () {},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/fotografia.png',
                scale: 15,
              ),
              FlatButton(
                onPressed: () async {
                  final PickedFile file =
                      await picker.getImage(source: ImageSource.camera);
                  File(file.path);
                  imageSelected(File(file.path));
                },
                child: Text('Câmera'),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/galeria.png',
                scale: 15,
              ),
              FlatButton(
                onPressed: () async {
                  final PickedFile file =
                      await picker.getImage(source: ImageSource.gallery);
                  File(file.path);
                  imageSelected(File(file.path));
                },
                child: Text('Galeria'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
