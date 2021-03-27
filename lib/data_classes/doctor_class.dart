class Doctor{

  final int doctorId;
  final String doctorName;
  final String bio;
  final int hospitalId;
  final int categoryId;
  bool available ;

  Doctor({
    this.doctorId,this.doctorName,this.bio,this.hospitalId,this.categoryId,this.available = true
});
}
List<Doctor> doctors = [
  Doctor(doctorId: 1,doctorName: "Dr. Pranay Verma",hospitalId: 1,categoryId: 1),
  Doctor(doctorId: 4,doctorName: "Dr. Rakesh Jhunjhunwala",hospitalId: 2,categoryId: 1),
  Doctor(doctorId: 8,doctorName: "Dr. Pranay Verma",hospitalId: 3,categoryId: 1),
  Doctor(doctorId: 9,doctorName: "Dr. KS Gopinath",hospitalId: 4,categoryId: 1),
  Doctor(doctorId: 6,doctorName: "Dr. Amrendra Taneja",hospitalId: 1,categoryId: 2),
  Doctor(doctorId: 7,doctorName: "Dr. Pranay Verma",hospitalId: 1,categoryId: 2),
  Doctor(doctorId: 5,doctorName: "Dr. Satish Dhawan",hospitalId: 2,categoryId: 3),
  Doctor(doctorId: 5,doctorName: "Dr. Pranay Verma",hospitalId: 1,categoryId: 3),
  Doctor(doctorId: 3,doctorName: "Dr. Kabir Wadhwa",hospitalId: 2,categoryId: 4),
  Doctor(doctorId: 5,doctorName: "Dr. Pranay Verma",hospitalId: 1,categoryId: 4),
  Doctor(doctorId: 5,doctorName: "Dr. Shashika Roy",hospitalId: 1,categoryId: 5),
  Doctor(doctorId: 5,doctorName: "Dr. Tripti Sinha",hospitalId: 3,categoryId: 5),
  Doctor(doctorId: 2,doctorName: "Dr. Arjun Reddy ",hospitalId: 1,categoryId: 6),
  Doctor(doctorId: 10,doctorName: "Dr. Priti",hospitalId: 2,categoryId: 6),
];

List<Doctor> getDoctorByCategoryId(int hospitalId,int categoryId){
  return doctors.where((doctor) => (doctor.hospitalId == hospitalId) && (doctor.categoryId == categoryId)).toList();
}
