import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:petcare/pet/components/imagesource.dart';
import 'package:petcare/pet/models/pets.dart';

class ImageForm extends StatelessWidget {
  const ImageForm(this.pets);
  final Pets pets;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: List.from(pets.images),
      builder: (state) {
        void onImageSelected(File file) {
          state.value.add(file);
          state.didChange(state.value);
          Navigator.of(context).pop();
        }

        return AspectRatio(
          aspectRatio: 1,
          child: Carousel(
            images: state.value.map<Widget>((image) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  if (image is String)
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    )
                  else
                    Image.file(
                      image as File,
                      fit: BoxFit.cover,
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.delete_forever),
                      color: Colors.redAccent,
                      onPressed: () {
                        state.value.remove(image);
                        state.didChange(state.value);
                      },
                    ),
                  ),
                ],
              );
            }).toList()
              ..add(
                Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_sharp,
                      size: 50,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) =>
                            ImageSourceSheet(imageSelected: onImageSelected),
                      );
                    },
                  ),
                ),
              ),
            dotSize: 4,
            dotSpacing: 15,
            dotBgColor: Colors.transparent,
            autoplay: false,
          ),
        );
      },
    );
  }
}
