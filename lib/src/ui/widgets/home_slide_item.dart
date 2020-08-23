import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

import '../detail_screen.dart';

class HomeSlideItem extends StatelessWidget {
  HomeSlideItem({
    Key key,
    this.image,
    this.title,
    this.autor,
    this.likes,
    this.days,
  });
  final String image;
  final String title;
  final String autor;
  final int likes;
  final int days;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DetailScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(right: 10, bottom: kDefaultPadding * 1.5),
            width: size.width,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.1,
          bottom: 0,
          child: Container(
            width: size.width * 0.8,
            //height: size.height * 0.17,
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: kBackgroudAltColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  autor,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Days: $days",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "$likes",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
