import 'package:flutter/material.dart';
import 'package:queueless/covid_dashboard/covidDashboard.dart';
import 'package:provider/provider.dart';
import 'package:queueless/covid_dashboard/covid_data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CovidDataProvider())
      ],
      child: MaterialApp(
        title: 'Queueless',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CovidDashboard()
      ),
    );
  }
}