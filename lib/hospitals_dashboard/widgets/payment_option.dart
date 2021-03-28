import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onTap;

  PaymentOption({this.imagePath, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          'assets/images/$imagePath',
        ),
        radius: 20,
      ),
      onTap: () {},
      title: Text(title),
    );
  }
}
