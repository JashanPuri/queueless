import 'package:flutter/material.dart';
import 'package:queueless/common-widgets/text_widget.dart';
class TableHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: TextWidget("Location",isBold: true)),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: TextWidget("Active",isBold: true,color: Colors.blueAccent)),
            Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: TextWidget("Recovered",isBold: true,color: Colors.green)),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: TextWidget("Deaths",isBold: true,color: Colors.redAccent)),
                              ],
                            ),
                          );
  }
}