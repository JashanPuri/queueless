import 'package:flutter/material.dart';

class HospitalImage extends StatelessWidget {
  final String img;

  const HospitalImage({
    @required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            img,
          ),
        ),
      ),
    );
  }
}