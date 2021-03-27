import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/common-widgets/text_widget.dart';
import '../data_classes/appointment_class.dart';
import './progress_indicator.dart';
import 'appointment_card.dart';

class DoctorDashboard extends StatefulWidget {
  static const routeName = 'doctor-dashboard';
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    final _pendingAppointments = Provider.of<AppointmentProvider>(context,listen:true).getAppointmentsByDoctorId(1);
    final _completedAppointments = Provider.of<AppointmentProvider>(context,listen:true).getCompletedAppointmentsByDoctorId(1);
    final _completed = _completedAppointments.length;
    final _pending = _pendingAppointments.length;
    final _total = _pending + _completed;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: TextWidget(
                    "Hello,",
                    size: 23,
                    fontWeight: FontWeight.normal,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: TextWidget("Dr. Mathew", size: 30),
              ),
              ProgressIndicatorWidget(completed: _completed, total: _total),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 5),
                child: TextWidget(
                  "Today's Appointments",
                  size: 18,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _pendingAppointments
                      .map((e) => AppointmentCard(e,ObjectKey(e.appointmentId)))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


