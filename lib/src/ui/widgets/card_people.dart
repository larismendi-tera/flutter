import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class CardPeople extends StatelessWidget {
  CardPeople({
    Key key,
    this.image,
    this.name,
    this.date,
  });
  final String image;
  final String name;
  final String date;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPadding * .5),
          margin:
              EdgeInsets.only(left: kDefaultPadding, bottom: kDefaultPadding),
          width: size.width * .4,
          height: size.height * .2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryColor,
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: kDefaultPadding,
          left: kDefaultPadding,
          child: Container(
            width: size.width * .4,
            height: size.height * .05,
            padding: EdgeInsets.only(
                left: kDefaultPadding * .5, right: kDefaultPadding * .5),
            decoration: BoxDecoration(
                color: kBackgroudAltColor.withAlpha(150),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: kBackgroudColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: size.width * .4,
          margin: EdgeInsets.only(left: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                    right: kDefaultPadding * .5, top: 5, bottom: 5),
                width: size.width * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: kBackgroudAltColor.withAlpha(190),
                ),
                child: Text(
                  date,
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
