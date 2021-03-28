import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:queueless/common-widgets/text_widget.dart';
import 'package:queueless/data_classes/appointment_class.dart';

class AppointmentCardDoctor extends StatelessWidget {
  final apnmt;
  final key;
  final color;
  AppointmentCardDoctor(this.apnmt, this.key, {this.color});

  List<Color> _colors = [
    Colors.orange,
    Colors.redAccent,
    Colors.green[600],
    Colors.blueAccent,
    Colors.pink,
    Colors.purple[300]
  ];
  Random rnd = new Random();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      actionPane: SlidableDrawerActionPane(),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.redAccent, size: 50),
            onPressed: null),
      ],
      secondaryActions: <Widget>[
        IconButton(
            icon: Icon(Icons.done_rounded, color: Colors.green, size: 50),
            onPressed: () =>
                Provider.of<AppointmentProvider>(context, listen: false)
                    .markCompleted(apnmt.doctorId, apnmt.patientId)),
      ],
      child: Container(
        width: double.infinity,
        height: 120,
        margin: EdgeInsets.only(bottom: 8),
        child: Card(
          color: color == null ? _colors[apnmt.appointmentId % 6] : color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  apnmt.patientName,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(height: 5),
                TextWidget(
                  "Age : ${apnmt.age.toString()}",
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(height: 5),
                TextWidget(
                  "Time : ${DateFormat("h:mma").format(apnmt.estimatedAppointmentTime)}",
                  color: Colors.white,
                  size: 18,
                )
                // date time //TextWidget(DateFormat(r'''MMMM dd, yyyy 'at' hh:mm:ss a Z''').parse(apnmt.estimatedAppointmentTime.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
