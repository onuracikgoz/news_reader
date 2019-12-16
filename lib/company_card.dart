


import 'package:flutter/material.dart';
import 'package:news_reader/news_screen.dart';

class CompanyCard extends StatelessWidget {
  final String imageUrl;
  final String companyLink;

  CompanyCard({this.imageUrl, this.companyLink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsScreen(companyLink: companyLink,)));
      },
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black,blurRadius: 7.0 )],),
        margin: EdgeInsets.all(15.0),
        width: 110.0,
        height: 110.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),



          child: Image.asset(

            imageUrl,
            fit: BoxFit.fill,


          ),
        ),
      ),
    );
  }
}
