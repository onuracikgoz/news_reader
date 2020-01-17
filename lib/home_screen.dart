import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/company_card.dart';
import 'package:news_reader/constant.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        buildContainer(),
      ],
    ));
  }
}

Container buildContainer() {
  return Container(
    color: Colors.white60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      SizedBox(
      width: 250.0,
      child: ScaleAnimatedTextKit(
        totalRepeatCount: 50,
          text: [
            "GÜNCEL",
            "HABERLER",

          ],
          textStyle: animationTitle,
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.center // or Alignment.topLeft
      ),
    ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CompanyCard(
                imageUrl: "images/sabah2.png",
                companyLink: 'https://www.sabah.com.tr/rss/anasayfa.xml',
              ),
              CompanyCard(
                imageUrl: "images/hurriyet2.png",
                companyLink: 'http://www.hurriyet.com.tr/rss/gundem',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CompanyCard(
              imageUrl: "images/haberturk.png",
              companyLink: 'http://www.haberturk.com/rss',
            ),
            CompanyCard(
              imageUrl: "images/takvim.png",
              companyLink: 'https://www.takvim.com.tr/rss/anasayfa.xml',
            ),
          ],
        )
      ],
    ),
  );
}
