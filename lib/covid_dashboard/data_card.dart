import 'package:flutter/material.dart';

class DataCardWidget extends StatelessWidget {
  final title;
  final val;
  final change;
  final double width;
  final color;
  const DataCardWidget(
      {@required this.width, this.title, this.val, this.change, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: width * 0.44,
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Icon(Icons.run_circle, color: color, size: 30),
                  ),
                  decoration: BoxDecoration(
                      //color: Colors.amber.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                val==null ? '' : val,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                "(${change==null ? '-': change})",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w900, color: color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
