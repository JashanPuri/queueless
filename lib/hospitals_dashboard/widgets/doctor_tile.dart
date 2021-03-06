import 'package:flutter/material.dart';
import 'package:queueless/data_classes/doctor_class.dart';
import 'package:queueless/hospitals_dashboard/screens/appointment_form.dart';
//import 'package:queueless/hospitals_dashboard/screens/payment_screen.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  final String img;
  final Function bookApt;

  const DoctorTile({Key key, this.doctor, this.img, this.bookApt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      // elevation: 3,
      child: ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Do you really want to book an appointment ?'),
              actions: [
                TextButton(
                  child: Text('YES'),
                  onPressed: () {
                    while (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    Navigator.of(context).pushNamed(AppointmentForm.routeName);
                  },
                ),
                TextButton(
                  child: Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red,
          backgroundImage: AssetImage(
            'assets/images/doctor-avatar.jpg',
          ),
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
