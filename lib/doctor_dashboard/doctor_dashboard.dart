import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common-widgets/text_widget.dart';
import '../doctor_dashboard/widgets/complete_task.dart';
import '../data_classes/appointment_class.dart';
import 'widgets/progress_indicator.dart';
import 'widgets/appointment_card_doctor.dart';

class DoctorDashboard extends StatefulWidget {
  static const routeName = 'doctor-dashboard';
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  bool _isAvailable = false;
  void _changeState() {
    setState(() {
      _isAvailable = !_isAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pendingAppointments =
        Provider.of<AppointmentProvider>(context, listen: true)
            .getAppointmentsByDoctorId(1);
    final _completedAppointments =
        Provider.of<AppointmentProvider>(context, listen: true)
            .getCompletedAppointmentsByDoctorId(1);
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          "Hello,",
                          size: 23,
                          fontWeight: FontWeight.normal,
                        ),
                        TextWidget("Dr. Mathew", size: 30),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      maxRadius: 25,
                      minRadius: 20,
                      child: TextWidget(
                        'M',
                        isBold: true,
                        color: Colors.white,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
              ProgressIndicatorWidget(
                  completed: _completed,
                  total: _total,
                  isAvailable: _changeState,
                  status: _isAvailable),
              DashboardLabel("Today's Appointments"),
              SizedBox(height: 10),
              if (_pendingAppointments.length == 0) CompleteTaskWidget(),
              if (_pendingAppointments.length != 0)
                Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _pendingAppointments
                        .map((e) =>
                            AppointmentCardDoctor(e, ObjectKey(e.appointmentId)))
                        .toList(),
                  ),
                ),
                SizedBox(height: 10),
                DashboardLabel("Completed Appointments"),
              if (_completedAppointments != 0)
              Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _completedAppointments
                        .map((e) =>
                            AppointmentCardDoctor(e, ObjectKey(e.appointmentId),color: Colors.grey[500],))
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardLabel extends StatelessWidget {
  final label;
  DashboardLabel(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, bottom: 5),
      child: TextWidget(
        label,
        size: 18,
      ),
    );
  }
}
