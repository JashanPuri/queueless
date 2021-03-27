import 'package:flutter/material.dart';
import 'package:queueless/article/article_dashboard.dart';
import '../../hospitals_dashboard/screens/hospital_list_screen.dart';
import '../../covid_dashboard/covidDashboard.dart';
import './dashboard_card.dart';

class DashboardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: width > 550
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DashboardCard(
              height: width > 400 ? 150 : 100,
              imgName: 'hospital-clipart.png',
              label: 'HOSPITALS',
              onTap: () =>
                  Navigator.of(context).pushNamed(HospitalListScreen.routeName),
            ),
            SizedBox(height: 15),
            DashboardCard(
              height: width > 400 ? 100 : 70,
              imgName: 'history-clipart.png',
              label: 'HISTORY',
              onTap: () {},
            ),
          ],
        ),
        Column(
          children: [
            DashboardCard(
              height: width > 400 ? 100 : 70,
              imgName: 'article-clipart.png',
              label: 'ARTICLES',
              onTap: () => Navigator.of(context).pushNamed(
                ArticleDashboard.routeName,
              ),
            ),
            SizedBox(height: 15),
            DashboardCard(
              height: width > 400 ? 150 : 100,
              imgName: 'covid-avatar.png',
              label: width > 400 ? 'COVID-19 STATS' : 'COVID-19',
              onTap: () => Navigator.of(context).pushNamed(
                CovidDashboard.routeName,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
