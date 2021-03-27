import 'package:flutter/material.dart';

class ArticleBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 120,
        width: double.infinity,
        margin: EdgeInsets.only(
            left: 15, bottom: 30,right: 15),
        child: ClipRRect(
          child: Image.asset("assets/images/article_banner.png",fit: BoxFit.fitWidth,),
          borderRadius: BorderRadius.circular(15)
        ),
        );
  }
}