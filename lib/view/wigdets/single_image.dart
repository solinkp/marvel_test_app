import 'package:flutter/widgets.dart';

import 'package:marvel_test/res/constants/constants.dart';

class SingleImage extends StatelessWidget {
  final String imageUrl;

  const SingleImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      placeholder: const AssetImage(placeholderImage),
      image: NetworkImage(imageUrl),
      imageErrorBuilder: (_, __, ___) {
        return Image.asset(placeholderImage);
      },
    );
  }
}
