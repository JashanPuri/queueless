import 'package:flutter/material.dart';
import 'package:queueless/home_dashboard.dart/widgets/dashboard_items.dart';
import '../widgets/appointment_card.dart';

class HomeDashboard extends StatelessWidget {
  static const routeName = '/home_dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('eaksdbakb'),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Hello,',
                style: const TextStyle(fontSize: 23),
              ),
              Text(
                'Jessica!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Appointments',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              AppointmentCard(),
              SizedBox(height: 30),
              const Text(
                'Explore more',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              DashboardItems(),
            ],
          ),
        ),
      ),
    );
  }
}
