import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/data_classes/category_class.dart';
import 'package:queueless/data_classes/doctor_class.dart';
import 'package:queueless/hospitals_dashboard/widgets/doctor_tile.dart';

class DoctorsListScreen extends StatelessWidget {
  static const routeName = './doctors_list_screen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final category = args['category'] as Categories;
    final hospId = args['hospId'];

    final _doctors = Provider.of<DoctorsProvider>(
      context,
      listen: false,
    ).getDocsById(
      hospId,
      category.categoryId,
    );

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: category.categoryId,
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/${category.categoryIconPath}',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ..._doctors
                  .map((doctor) => DoctorTile(
                    doctor: doctor,
                    img: category.categoryIconPath,
                  ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
