import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/covid_dashboard/covid_data_provider.dart';
import './data_card.dart';

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
      body: FutureBuilder(
        future:
            Provider.of<CovidDataProvider>(context, listen: false).getData(),
        builder: (builder, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<CovidDataProvider>(builder: (builder, data, _) {
                final overallData = data.overallData;
                var deltaActive = int.parse(overallData.deltaConfirmed) -
                    (int.parse(overallData.deltaRecovered) +
                        int.parse(overallData.deltaDeaths));
                final stateWiseData = data.stateWiseData;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "Covid 19 Statistics",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          )),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          "States/UT Data",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                      //SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: stateWiseData.length - 1,
                          itemBuilder: (context,index) => Text(stateWiseData[index].stateName)
                          ),
                      )
                    ],
                  ),
                );
              }),
      ),
    );
  }
}
