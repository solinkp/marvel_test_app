import 'package:flutter/widgets.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:marvel_test/res/constants/constants.dart';

class SwiperImages extends StatelessWidget {
  final List<String> imagesUrls;

  const SwiperImages({super.key, required this.imagesUrls});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: imagesUrls.length,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      loop: true,
      itemBuilder: (context, index) => FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage(placeholderImage),
        image: NetworkImage(imagesUrls[index]),
        imageErrorBuilder: (_, __, ___) {
          return Image.asset(placeholderImage);
        },
      ),
    );
  }
}
