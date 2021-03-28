import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:queueless/auth/screens/loginScreen.dart';
import 'package:queueless/data_classes/appointment_class.dart';
import 'package:queueless/doctor_dashboard/doctor_dashboard.dart';
import 'package:queueless/data_classes/doctor_class.dart';
import 'package:queueless/hospitals_dashboard/screens/appointment_form.dart';
import 'package:queueless/hospitals_dashboard/screens/doctors_list_screen.dart';
import 'package:queueless/hospitals_dashboard/screens/payment_screen.dart';
import './article/article_provider.dart';
import './data_classes/hospital_dataclass.dart';
import './hospitals_dashboard/screens/hospital_detail_screen.dart';
import './hospitals_dashboard/screens/hospital_list_screen.dart';
import './article/article_dashboard.dart';
import './article/article_detail.dart';
import './custom_route_transition.dart';
import './home_dashboard.dart/screens/home_dashboard.dart';
import './covid_dashboard/covidDashboard.dart';
import './covid_dashboard/covid_data_provider.dart';
import './scrollbehavior.dart';
import './auth/screens/otp-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CovidDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HospitalsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentProvider(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'Queueless',
        theme: ThemeData(
          fontFamily: 'vag',
          primaryColor: Color(0xFF1614E0),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        home: HomeDashboard(),
        routes: {
          OtpScreen.routeName: (context) => OtpScreen(),
          CovidDashboard.routeName: (context) => CovidDashboard(),
          ArticleDetail.routeName: (context) => ArticleDetail(),
          ArticleDashboard.routeName: (context) => ArticleDashboard(),
          HomeDashboard.routeName: (context) => HomeDashboard(),
          HospitalListScreen.routeName: (context) => HospitalListScreen(),
          HospitalDetailScreen.routeName: (context) => HospitalDetailScreen(),
          DoctorDashboard.routeName: (context) => DoctorDashboard(),
          DoctorsListScreen.routeName: (context) => DoctorsListScreen(),
          AppointmentForm.routeName: (context) => AppointmentForm(),
          PaymentScreen.routeName: (context) => PaymentScreen()
        },
      ),
    );
  }
}
