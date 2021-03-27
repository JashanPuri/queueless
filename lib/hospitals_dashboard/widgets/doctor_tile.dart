import 'package:flutter/material.dart';
import 'package:queueless/data_classes/doctor_class.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      // elevation: 3,
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            doctor.doctorName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
