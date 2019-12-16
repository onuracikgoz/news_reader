import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/company_card.dart';
import 'package:news_reader/constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          color: Colors.white60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('En Güncel Haberler',style: homeScreenTitle,),
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
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.black,
        ),
        Container(
          color: Colors.white,
        ),
      ],
    );
  }
}
