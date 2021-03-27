import 'package:flutter/material.dart';
import '../widgets/hospital_card.dart';

class HospitalListScreen extends StatelessWidget {
  static const routeName = './hospital_list_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Colors.black,
          iconSize: 36,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Choose hospital',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            iconSize: 30,
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => HospitalCard(),
      ),
    );
  }
}
