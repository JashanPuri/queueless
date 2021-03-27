import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/category_item.dart';
import '../widgets/hospital_detail_field.dart';
import '../../data_classes/hospital_dataclass.dart';
import '../widgets/hospital_image.dart';
import 'doctors_list_screen.dart';

class HospitalDetailScreen extends StatelessWidget {
  static const routeName = './hospital_details_screen';

  @override
  Widget build(BuildContext context) {
    final _hospitalId = ModalRoute.of(context).settings.arguments as int;
    final _hospital = Provider.of<HospitalsProvider>(
      context,
      listen: false,
    ).getHospitalById(_hospitalId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HospitalImage(img: _hospital.hospitalImageLink),
            SizedBox(height: 20),
            Text(
              _hospital.hospitalName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _hospital.address,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            HospitalDetailField(
              value: _hospital.phone,
              icon: Icons.phone,
            ),
            SizedBox(height: 7),
            HospitalDetailField(
              value: _hospital.email,
              icon: Icons.email,
            ),
            SizedBox(height: 30),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: _hospital.categories
                    .map(
                      (category) => CategoryItem(
                        category: category,
                        onTap: () => Navigator.of(context).pushNamed(
                          DoctorsListScreen.routeName,
                          arguments: {
                            'category': category,
                            'hospId': _hospitalId,
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
