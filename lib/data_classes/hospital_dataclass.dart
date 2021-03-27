import 'dart:io';
import './category_class.dart';
import './doctor_class.dart';

class Hospital{

  final int hospitalId;
  final String hospitalName;
  final String address;
  final int phone;
  final String email;
  File hospitalImage;
  List<Categories> categories;
  final Map<Categories,List<Doctor>> availableDoctors;

  Hospital({
    this.hospitalId, this.hospitalName, this.address, this.phone, this.email, this.hospitalImage, this.availableDoctors,this.categories
  });
}
List<Hospital> availableHospitals = [
  Hospital(hospitalId:1,hospitalName:"AIIMS IGITIT",address:"Dwarka Sector-3C",phone: 8963254189,email:"aiimsigitit@aiims.in"),
  Hospital(hospitalId:2,hospitalName:"AIIMS IGITIT",address:"Dwarka Sector-3C",phone: 8963254189,email:"aiimsigitit@aiims.in"),
  Hospital(hospitalId:3,hospitalName:"AIIMS IGITIT",address:"Dwarka Sector-3C",phone: 8963254189,email:"aiimsigitit@aiims.in"),
  Hospital(hospitalId:4,hospitalName:"AIIMS IGITIT",address:"Dwarka Sector-3C",phone: 8963254189,email:"aiimsigitit@aiims.in"),
];

List<Hospital> getHospitals(){
  return availableHospitals;
}

List<Categories> cate = getCategories();

Hospital getCategorybyHospitalId( int hospitalId) {
  Hospital _hospital;
  _hospital = availableHospitals.firstWhere((element) => element.hospitalId == hospitalId);
  _hospital.categories = cate;

  return _hospital;
}