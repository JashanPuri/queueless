import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String label;
  final Function onTap;
  final double height;
  final String imgName;

  DashboardCard({this.height, this.imgName, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color.fromRGBO(247, 247, 247, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset(
                  'assets/images/$imgName',
                  height: height,
                  width: width > 350 ? 145 : 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
