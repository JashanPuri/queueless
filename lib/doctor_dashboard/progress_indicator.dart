import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../common-widgets/text_widget.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int completed;
  final int total;

  ProgressIndicatorWidget({this.completed, this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius: 110.0,
            lineWidth: 12.0,
            animation: true,
            percent: completed / total,
            center: new Text(
              "${((completed / total) * 100).toStringAsPrecision(4)}%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.deepPurple,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Today's Progress",
                isBold: true,
                size: 18,
              ),
              Row(
                children: [
                  TextWidget("$completed/$total"),
                  SizedBox(width: 15, height: 40),
                  TextWidget(
                    "Patients Done",
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(color: Colors.green.shade200, blurRadius: 3)
                      ]),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )),
                  SizedBox(width: 15, height: 40),
                  TextWidget(
                    "Available",
                    color: Colors.green,
                    isBold: true,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
