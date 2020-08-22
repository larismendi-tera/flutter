import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/feed_screen.dart';
import 'package:myapp/src/ui/detail_screen.dart';
import 'package:myapp/src/ui/widgets/card_people.dart';
import 'package:myapp/src/ui/widgets/feed_content.dart';
import 'package:myapp/src/ui/widgets/header_slider.dart';
import 'package:myapp/src/ui/widgets/section_title.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: kPrimaryColor,
        ),
        FeedScreen()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Perfil",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: kPrimaryColor,
        ),
        DetailScreen()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          onTap: () {},
          name: "LogOut",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: kPrimaryColor,
        ),
        null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: kBorderColor,
      backgroundColorAppBar: kBackgroudColor,
      screens: items,
      typeOpen: TypeOpen.FROM_LEFT,
      //    disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      //    slidePercent: 70.0,
      //    verticalScalePercent: 80.0,
      contentCornerRadius: 40.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      backgroundMenu: DecorationImage(
          scale: 2.5,
          alignment: Alignment(-0.9, -.8),
          image: ExactAssetImage('assets/images/logoTeraton.png'),
          fit: BoxFit.scaleDown),
    );
    //Size size = MediaQuery.of(context).size;
    /*return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SectionTitle(title: "Proximos Eventos", buttonText: "ver mas"),
            HeaderSlider(),
            SectionTitle(title: "Proximos Cumpleaños", buttonText: "ver mas"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardPeople(
                      image: "assets/images/persona1.jpg",
                      name: "karen",
                      date: "Sep 7"),
                  CardPeople(
                      image: "assets/images/persona2.jpg",
                      name: "Chu-li",
                      date: "Oct 10"),
                  CardPeople(
                      image: "assets/images/persona3.jpg",
                      name: "Kate",
                      date: "Nov 15"),
                ],
              ),
            ),
            SectionTitle(title: "Feed", buttonText: ""),
            FeedContent(),
            FeedContent(),
          ],
        ),
      ),
    );*/
  }
}
