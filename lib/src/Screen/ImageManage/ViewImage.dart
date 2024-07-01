// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../ComponentsUtils/PanelCloseWiget.dart';
import '../../Localization/LanguageConstants.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.widthImage,
    required this.heightImage,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double widthImage;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        width: width,
        height: height,
        child: PanelCloseWiget(
          widthValue: width,
          heightValue: height - 50,
          txtValue: getTranslated(context, 'IMAGE')!,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: widthImage,
                height: heightImage,
                fit: BoxFit.fill,
              ),
            ],
          ),
          icon: const Icon(Icons.image),
        ),
      ),
    );
  }
}
