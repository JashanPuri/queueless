import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/data_classes/hospital_dataclass.dart';
import '../widgets/hospital_card.dart';

class HospitalListScreen extends StatelessWidget {
  static const routeName = './hospital_list_screen';

  @override
  Widget build(BuildContext context) {

    final _hospitalProvider = Provider.of<HospitalsProvider>(context);
    final _hospitals = _hospitalProvider.availableHospitals;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
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
        itemCount: _hospitals.length,
        itemBuilder: (context, index) => HospitalCard(
          hospitalId: _hospitals[index].hospitalId,
          name: _hospitals[index].hospitalName,
          address: _hospitals[index].address,
          imgLink: _hospitals[index].hospitalImageLink,
        ),
      ),
    );
  }
}
