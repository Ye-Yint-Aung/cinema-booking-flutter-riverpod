import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AdsSlideShowWidget extends StatelessWidget {
  const AdsSlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: ImageSlideshow(
        indicatorColor: Colors.blue,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.network(
            'https://i.pinimg.com/564x/7f/0c/7f/7f0c7fce774a543e3492ab76dc16663d.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://media.istockphoto.com/id/848210156/vector/cinema.jpg?s=2048x2048&w=is&k=20&c=k9-sDmRDzoEUb3ncMiQHDVx-9aSdjkAYtF4Ap_I1a0U=',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://media.istockphoto.com/id/1391739136/vector/realistic-golden-film-strip-cinema-background.jpg?s=2048x2048&w=is&k=20&c=Fmr52UvozgRyKN87AwZYrmVenQV6NaZ--8hQbO4TWso=',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
