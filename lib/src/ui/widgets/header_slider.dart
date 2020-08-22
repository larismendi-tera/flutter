import 'package:flutter/material.dart';
import 'package:myapp/src/ui/widgets/home_slide_item.dart';

class HeaderSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeSlideItem(
                  image: "assets/images/oficina.jpg",
                  title: "Regreso a tera VZLA",
                  autor: "RRHH",
                  likes: 10,
                  days: 5),
              HomeSlideItem(
                  image: "assets/images/playa.jpg",
                  title: "Playaa!!!",
                  autor: "RRHH",
                  likes: 200,
                  days: 2),
              HomeSlideItem(
                  image: "assets/images/cine.jpg",
                  title: "Tera Cine",
                  autor: "RRHH",
                  likes: 25,
                  days: 7),
            ],
          ),
        )
      ],
    );
  }
}
