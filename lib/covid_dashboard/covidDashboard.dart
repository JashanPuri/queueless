import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/covid_dashboard/covid_data_provider.dart';
import 'package:queueless/covid_dashboard/widgets/table_head.dart';
import 'package:queueless/common-widgets/text_widget.dart';
import 'widgets/data_card.dart';
import './widgets/covid_banner.dart';

class CovidDashboard extends StatefulWidget {
  static const routeName = 'covid-dashboard';
  @override
  _CovidDashboardState createState() => _CovidDashboardState();
}

class _CovidDashboardState extends State<CovidDashboard> {
  @override
  Widget build(BuildContext context) {
    //Provider.of<CovidDataProvider>(context).getData();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<CovidDataProvider>(context, listen: false).getData(),
          builder: (builder, snapshot) => snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<CovidDataProvider>(builder: (builder, data, _) {
                  final overallData = data.overallData;
                  var deltaActive = int.parse(overallData.deltaConfirmed) -
                      (int.parse(overallData.deltaRecovered) +
                          int.parse(overallData.deltaDeaths));
                  final stateWiseData = data.stateWiseData;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,bottom: 10),
                            child: Row(children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios), 
                                onPressed: () => Navigator.of(context).pop()),
                                SizedBox(width: 15,),
                                TextWidget("Covid Stats (India)",size: 27,isBold: true)
                            ],),
                          ),
                          CovidBanner(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DataCardWidget(
                                width: width,
                                title: "Total Confirmed",
                                val: overallData.totalConfirmed,
                                change: overallData.deltaConfirmed + ' ↑',
                                color: Colors.amber,
                              ),
                              DataCardWidget(
                                width: width,
                                title: "Total Death",
                                val: overallData.totalDeaths,
                                change: overallData.deltaDeaths + ' ↑',
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DataCardWidget(
                                width: width,
                                title: "Total Recovered",
                                val: overallData.totalRecovered,
                                change: overallData.deltaRecovered + ' ↑',
                                color: Colors.green,
                              ),
                              DataCardWidget(
                                width: width,
                                title: "Total Active",
                                val: overallData.totalActive,
                                change:
                                    '${deltaActive.abs()} ${deltaActive < 0 ? ' ↓' : ' ↑'}',
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: TextWidget("All States/UT",isBold: true,size: 20)),
                          SizedBox(height: 10,),
                          TableHead(),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: stateWiseData.map((e) => Row(
                              children: [
                                Flexible(
                                    fit: FlexFit.tight,
                                    flex: 5,
                                    child: TextWidget(e.stateName,size: 14)),
                                Flexible(
                                    fit: FlexFit.tight,
                                    flex: 3,
                                    child: TextWidget(e.totalActive,color: Colors.blueAccent.withOpacity(0.7))),
                                Flexible(
                                    fit: FlexFit.tight,
                                    flex: 4,
                                    child: TextWidget(e.totalRecovered,color: Colors.green.withOpacity(0.7))),
                                Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: TextWidget(e.totalDeaths,color: Colors.redAccent.withOpacity(0.7))),
                              ],
                            )).toList(),
                            )
                          )
                        ],
                      ),
                    ),
                  );
                }),
        ),
      ),
    );
  }
}

