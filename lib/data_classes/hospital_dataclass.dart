import 'package:flutter/cupertino.dart';

import './category_class.dart';
import './doctor_class.dart';

class Hospital {
  final int hospitalId;
  final String hospitalName;
  final String address;
  final String phone;
  final String email;
  final String hospitalImageLink;
  List<Categories> categories;
  final Map<Categories, List<Doctor>> availableDoctors;

  Hospital({
    this.hospitalId,
    this.hospitalName,
    this.address,
    this.phone,
    this.email,
    this.hospitalImageLink,
    this.availableDoctors,
    this.categories,
  });
}

class HospitalsProvider with ChangeNotifier {
  List<Hospital> _availableHospitals = [
    Hospital(
      hospitalId: 1,
      hospitalName: "AIIMS IGITIT",
      address: "Dwarka Sector-3C",
      phone: '8963254189',
      email: "aiimsigitit@aiims.in",
      categories: availablecategories,
      hospitalImageLink:
          'https://bsmedia.business-standard.com/_media/bs/img/article/2017-03/17/full/1489734350-5336.jpg',
    ),
    Hospital(
      hospitalId: 2,
      hospitalName: "AIIMS IGITIT",
      address: "Dwarka Sector-3C",
      phone: '8963254189',
      email: "aiimsigitit@aiims.in",
      categories: availablecategories,
      hospitalImageLink:
          'https://bsmedia.business-standard.com/_media/bs/img/article/2017-03/17/full/1489734350-5336.jpg',
    ),
    Hospital(
      hospitalId: 3,
      hospitalName: "AIIMS IGITIT",
      address: "Dwarka Sector-3C",
      phone: '8963254189',
      email: "aiimsigitit@aiims.in",
      categories: availablecategories,
      hospitalImageLink:
          'https://bsmedia.business-standard.com/_media/bs/img/article/2017-03/17/full/1489734350-5336.jpg',
    ),
    Hospital(
      hospitalId: 4,
      hospitalName: "AIIMS IGITIT",
      address: "Dwarka Sector-3C",
      phone: '8963254189',
      email: "aiimsigitit@aiims.in",
      categories: availablecategories,
      hospitalImageLink:
          'https://bsmedia.business-standard.com/_media/bs/img/article/2017-03/17/full/1489734350-5336.jpg',
    ),
  ];

  List<Hospital> get availableHospitals {
    return _availableHospitals;
  }

  Hospital getHospitalById(int id) {
    return _availableHospitals.firstWhere(
      (element) => element.hospitalId == id,
    );
  }
}
